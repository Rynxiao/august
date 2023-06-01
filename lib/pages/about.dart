import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/widgets/custom_appbar.dart';

class About extends StatelessWidget {
  const About({super.key});

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: themeData.colorScheme.background,
              ),
              padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
              margin: const EdgeInsets.symmetric(
                vertical: Spacing.m,
                horizontal: Spacing.m,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Spacing.l,
                      bottom: Spacing.xs,
                    ),
                    child: Text(
                      '极简日历是由yhhu线下开发。',
                      style: descriptionStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: Spacing.xl),
                    child: Text(
                      '主要由于市面上一些应用太多广告。其中，主要的功能包括万年历、简单的天气预报以及生活小常识等模块，后续功能敬请期待...',
                      style: descriptionStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: Spacing.xl),
                    child: Text(
                      'version: 1.0.0',
                      style: descriptionStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
