import 'package:flutter/material.dart';

import '../../theme/fontweight.dart';
import '../../theme/spacing.dart';

class EventHeader extends StatelessWidget {
  final String title;
  final Future<void> Function() onAddOrUpdateEvent;

  const EventHeader({
    super.key,
    required this.title,
    required this.onAddOrUpdateEvent,
  });

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
                  title,
                  style: themeData.textTheme.titleLarge,
                ),
                GestureDetector(
                  onTap: onAddOrUpdateEvent,
                  child: Text(
                    '完成',
                    style: themeData.textTheme.titleMedium?.copyWith(
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
