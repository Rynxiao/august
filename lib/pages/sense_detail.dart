import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/widgets/custom_appbar.dart';

class SenseDetail extends StatelessWidget {
  final String id;

  const SenseDetail({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    var descriptionStyle = themeData.textTheme.bodyMedium?.copyWith(
      fontSize: AppFontSize.large,
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: '关于',
        backgroundColor: themeData.scaffoldBackgroundColor,
      ),
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(id)
          ],
        ),
      ),
    );
  }
}
