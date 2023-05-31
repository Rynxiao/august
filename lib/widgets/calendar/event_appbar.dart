import 'package:flutter/material.dart';
import 'package:simple_calendar/widgets/custom_appbar.dart';

import '../../theme/fontweight.dart';

class EventAppBar extends CustomAppBar {
  @override
  final String title;
  final Future<void> Function() onAddOrUpdateEvent;

  const EventAppBar({
    super.key,
    required this.title,
    required this.onAddOrUpdateEvent,
  }) : super(title: title);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return CustomAppBar(
      title: title,
      actions: [
        TextButton(
          onPressed: onAddOrUpdateEvent,
          child: Text(
            '完成',
            style: themeData.textTheme.titleMedium?.copyWith(
              color: themeData.primaryColor,
              fontWeight: AppFontWeight.regular,
            ),
          ),
        ),
      ],
    );
  }
}
