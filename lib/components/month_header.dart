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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.2,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onNavigateToMonth,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: Spacing.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${homeState.selectedYear} 年 ${homeState.selectedMonth} 月',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(
                Icons.arrow_drop_down,
              )
            ],
          ),
        ),
      ),
    );
  }
}
