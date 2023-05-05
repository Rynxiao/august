import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/core/calendar.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../states/home_state.dart';

class WeekHeader extends StatelessWidget {
  const WeekHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    var headers = homeState.calendar.getWeekdayHeaders(true);

    return Row(
      children: List.generate(headers.length, (index) {
        var textColor = index == 0 || index == headers.length - 1
            ? Theme.of(context).highlightColor
            : Theme.of(context).colorScheme.surface;
        return Expanded(
          child: Container(
            height: Spacing.xxs * 8,
            alignment: Alignment.center,
            child: Text(
              headers[index],
              style: TextStyle(color: textColor, fontSize: AppFontSize.small),
            ),
          ),
        );
      }),
    );
  }
}
