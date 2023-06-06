import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart';
import 'package:simple_calendar/states/sense_state.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/widgets/custom_appbar.dart';

import '../utils/date_utils.dart';

class SenseDetail extends StatelessWidget {
  final CommonSense sense;

  const SenseDetail({
    super.key,
    required this.sense,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final senseState = Provider.of<SenseState>(context);
    var types = senseState.types;
    var typeName =
        types.where((type) => type.id == sense.type).toList()[0].title;
    var descriptionStyle = themeData.textTheme.titleSmall?.copyWith(
      fontSize: AppFontSize.regular,
      color: themeData.dividerColor,
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: sense.title,
        backgroundColor: themeData.scaffoldBackgroundColor,
      ),
      backgroundColor: themeData.scaffoldBackgroundColor,
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
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    width: double.maxFinite,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                MarkdownBody(data: sense.content,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
