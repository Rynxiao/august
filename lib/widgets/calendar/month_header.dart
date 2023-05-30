import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/fontsize.dart';
import '../../theme/spacing.dart';
import '../../states/home_state.dart';

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
      color: themeData.colorScheme.background,
      child: GestureDetector(
        onTap: onNavigateToMonth,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: Spacing.xs),
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
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(right: Spacing.m),
                    child: InkWell(
                      onTap: () {
                        var now = DateTime.now();
                        if (!homeState.isSelected(now.year, now.month, now.day)) {
                          homeState.select(now.year, now.month, now.day);
                        }
                      },
                      child: Text(
                        '今天',
                        style: TextStyle(
                          fontSize: AppFontSize.medium,
                          color: themeData.primaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
