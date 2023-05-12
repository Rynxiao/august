import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/core/calendar_grid_utils.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../../states/home_state.dart';

class DateEvents extends StatelessWidget {
  const DateEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
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
      var titleStyle = themeData.textTheme.titleMedium?.copyWith(
          fontSize: AppFontSize.regular
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (festivals.isNotEmpty || index != 0)
                      const Divider(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: Spacing.xs),
                          child: CircleAvatar(
                            radius: 2,
                            backgroundColor: themeData.colorScheme.surface,
                          ),
                        ),
                        Text(
                          event.title,
                          style: titleStyle,
                        ),
                      ],
                    ),
                    if (event.content.isNotEmpty)
                      Padding(
                        padding:
                        const EdgeInsets.only(left: Spacing.s, top: Spacing.xxs),
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
}
