import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/fontweight.dart';

import '../states/home_state.dart';

class MonthHeader extends StatelessWidget {
  final int year;
  final int month;
  final VoidCallback? onNavigateToMonth;

  const MonthHeader({
    Key? key,
    required this.year,
    required this.month,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${homeState.selectedYear} 年 ${homeState.selectedMonth} 月',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: AppFontSize.medium,
              fontWeight: AppFontWeight.semiBold
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            color: AppColors.white,
            onPressed: onNavigateToMonth,
          ),
        ],
      ),
    );
  }
}
