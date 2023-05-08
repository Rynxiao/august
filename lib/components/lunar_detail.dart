import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/core/calendar_grid_utils.dart';
import 'package:simple_calendar/core/lunar_untils.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../states/home_state.dart';
import '../theme/colors.dart';

class LunarDetail extends StatelessWidget {
  const LunarDetail({
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
    final fitList = lunar.getDayYi();
    final tabooList = lunar.getDayJi();
    final birthdayHoroscope = getBirthdayHoroscope(lunar);
    final constellation = solar.getXingZuo();
    var fitStyle = themeData.textTheme.bodySmall?.copyWith(
      fontSize: AppFontSize.regular,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.s,
        horizontal: Spacing.l,
      ),
      color: themeData.colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Spacing.m),
                child: Text(
                  "${lunar.getMonthInChinese()}月${lunar.getDayInChinese()}",
                  style: themeData.textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Spacing.m),
                child: Text(
                  "周${solar.getWeekInChinese()}",
                  style: fitStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Spacing.m),
                child: Text(
                  "${constellationMap[constellation]}$constellation座",
                  style: fitStyle,
                ),
              ),
              Text(
                "${zodiacMap[lunar.getYearShengXiao()]}",
                style: fitStyle,
              )
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.xxs),
            child: Text(
              birthdayHoroscope,
              style: fitStyle?.copyWith(color: themeData.colorScheme.secondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.xxs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("宜 ", style: fitStyle?.copyWith(color: AppColors.green)),
                Expanded(
                  child: Text(fitList.join(" "), style: fitStyle),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.xxs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("忌 ",
                    style: fitStyle?.copyWith(color: themeData.highlightColor)),
                Expanded(
                  child: Text(tabooList.join(" "), style: fitStyle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
