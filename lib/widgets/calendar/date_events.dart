import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/core/calendar_grid_utils.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/fontweight.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/utils/date_utils.dart';

import '../../db/calendar.dart';
import '../../routes/routes.dart';
import '../../states/calendar_state.dart';

class DateEvents extends StatelessWidget {
  const DateEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<CalendarState>(context);
    final themeData = Theme.of(context);
    final lunar = getLunarDetail(
      homeState.selectedYear,
      homeState.selectedMonth,
      homeState.selectedDay,
    );
    final solar = lunar.getSolar();
    final festivals = getFestivalsBy(solar, lunar);
    var events = getDateEventsBy(homeState.dateEvents, solar, lunar);

    if (events.isEmpty && festivals.isEmpty) {
      return Container();
    } else {
      var festivalStyle = themeData.textTheme.bodySmall?.copyWith(
        fontSize: AppFontSize.regular,
        color: themeData.primaryColor,
      );
      var titleStyle = themeData.textTheme.titleMedium
          ?.copyWith(fontSize: AppFontSize.regular);
      var timeStyle = titleStyle?.copyWith(
        fontWeight: AppFontWeight.light,
        color: themeData.colorScheme.secondary,
      );

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.s,
          horizontal: Spacing.l,
        ),
        margin: const EdgeInsets.only(bottom: Spacing.xs),
        color: themeData.colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(festivals.length, (index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Spacing.xs),
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: themeData.primaryColor,
                      ),
                    ),
                    Text(
                      festivals[index],
                      style: festivalStyle,
                    )
                  ],
                );
              }),
            ),
            Column(
              children: List.generate(events.length, (index) {
                var event = events[index];
                var createTime =
                    formatDateHourFromMilliseconds(event.createTime);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (festivals.isNotEmpty || index != 0) const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: Spacing.xs),
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor: themeData.colorScheme.surface,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: Spacing.xs),
                              child: Text(
                                event.title,
                                style: titleStyle,
                              ),
                            ),
                            Text(
                              createTime,
                              style: timeStyle,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: Spacing.m),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  navigateTo(context, '/eventUpdate/${event.id}');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: Spacing.m),
                                  child: Icon(
                                    Icons.edit,
                                    size: 14,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  deleteEvent(event.id, () {
                                    homeState.setDateEvents();
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 14,
                                  color: themeData.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (event.content.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Spacing.s,
                          top: Spacing.xxs,
                        ),
                        child: Text(
                          event.content,
                          style: themeData.textTheme.bodySmall
                              ?.copyWith(fontSize: AppFontSize.regular),
                        ),
                      ),
                  ],
                );
              }),
            )
          ],
        ),
      );
    }
  }

  Future<void> deleteEvent(String id, Null Function() onDeleted) async {
    final deleted = await CalendarDB.deleteEventById(id);

    if (deleted) {
      onDeleted();
    }
  }
}
