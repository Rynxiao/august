import 'package:flutter/material.dart';

import '../../theme/fontweight.dart';
import '../../theme/spacing.dart';

class CreateEventHeader extends StatelessWidget {
  final Future<void> Function() onAddEvent;

  const CreateEventHeader({super.key, required this.onAddEvent});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      color: themeData.colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.m,
              vertical: Spacing.xs,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: themeData.colorScheme.surface,
                    size: 20,
                  ),
                ),
                Text(
                  '添加提醒',
                  style: themeData.textTheme.titleLarge,
                ),
                GestureDetector(
                  onTap: onAddEvent,
                  child: Text(
                    '完成',
                    style:
                    themeData.textTheme.titleMedium?.copyWith(
                      color: themeData.primaryColor,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}