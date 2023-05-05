import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/fontweight.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../states/home_state.dart';

class MonthHeader extends StatelessWidget {
  final VoidCallback? onNavigateToMonth;

  const MonthHeader({
    Key? key,
    this.onNavigateToMonth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightGray,
            width: 0.1,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onNavigateToMonth,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: Spacing.xs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${homeState.selectedYear} 年 ${homeState.selectedMonth} 月',
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeight.semiBold),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
