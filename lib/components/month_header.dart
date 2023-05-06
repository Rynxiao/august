import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/spacing.dart';
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
    final themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: themeData.colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: themeData.dividerColor,
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
                style: themeData.textTheme.titleMedium,
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
