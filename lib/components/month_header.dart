import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';

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
            '$year年$month月',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: AppFontSize.medium,
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
