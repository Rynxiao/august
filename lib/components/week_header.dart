import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/core/calendar.dart';
import 'package:simple_calendar/theme/spacing.dart';

class WeekHeader extends StatelessWidget {
  final Calendar calendar;

  const WeekHeader({
    Key? key,
    required this.calendar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headers = calendar.getWeekdayHeaders(true);
    return Row(
      children: List.generate(headers.length, (index) {
        var textColor = index == 0 || index == headers.length - 1
            ? AppColors.orangeRed
            : AppColors.gray100;
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
