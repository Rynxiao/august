import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart';
import 'package:simple_calendar/states/sense_state.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/widgets/custom_appbar.dart';

import '../states/global_state.dart';
import '../utils/date_utils.dart';
import '../widgets/network_image_container.dart';

class SenseDetail extends StatelessWidget {
  final CommonSense sense;

  const SenseDetail({
    super.key,
    required this.sense,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final senseState = Provider.of<SenseState>(context);
    var types = senseState.types;
    var typeName =
        types.where((type) => type.id == sense.type).toList()[0].title;
    var contentStyle = themeData.textTheme.bodySmall?.copyWith(
      fontSize: AppFontSize.medium,
      color: themeData.colorScheme.surface,
    );
    var descriptionStyle = themeData.textTheme.titleSmall?.copyWith(
      fontSize: AppFontSize.regular,
      color: themeData.dividerColor,
    );
    var backgroundColor = isDarkMode
        ? themeData.scaffoldBackgroundColor
        : themeData.colorScheme.background;

    return Scaffold(
      appBar: CustomAppBar(
        title: sense.title,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(Spacing.m),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Spacing.m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        typeName,
                        style: descriptionStyle,
                      ),
                      Text(
                        formatDateString(sense.updatedAt),
                        style: descriptionStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Spacing.m),
                  child: NetworkImageContainer(
                    imageUrl: sense.cover,
                    width: double.maxFinite,
                    height: 170,
                  ),
                ),
                MarkdownBody(
                  data: sense.content,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    p: contentStyle
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
