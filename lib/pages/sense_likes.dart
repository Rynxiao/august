import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart' as sense;
import 'package:simple_calendar/network/sense.dart';
import 'package:simple_calendar/routes/routes.dart';
import 'package:simple_calendar/states/sense_state.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../states/global_state.dart';
import '../utils/date_utils.dart';
import '../widgets/custom_appbar.dart';

class SenseLikes extends StatefulWidget {
  const SenseLikes({super.key});

  @override
  State<SenseLikes> createState() => _SenseLikesState();
}

class _SenseLikesState extends State<SenseLikes> {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);
    var backgroundColor = isDarkMode
        ? themeData.scaffoldBackgroundColor
        : themeData.colorScheme.background;

    return Scaffold(
      appBar: CustomAppBar(
        title: '我的收藏',
        backgroundColor: themeData.scaffoldBackgroundColor,
      ),
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: SafeArea(
        child: FutureBuilder(
          future: getLikedCommonSenses(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text('加载错误，请稍候再试!!!'),
                );
              } else {
                var senses = dataSnapshot.data;
                if (senses != null && senses.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildSenseItem(
                            context,
                            backgroundColor,
                            senses[index],
                          );
                        },
                        itemCount: senses.length,
                      ),
                    ]),
                  );
                } else {
                  return const Center(
                    child: Text('空空如也!'),
                  );
                }
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildSenseItem(
    BuildContext context,
    Color backgroundColor,
    sense.CommonSense commonSense,
  ) {
    final themeData = Theme.of(context);
    var titleStyle = themeData.primaryTextTheme.titleMedium
        ?.copyWith(color: themeData.colorScheme.surface);
    var dateStyle = themeData.primaryTextTheme.labelLarge?.copyWith(
      color: themeData.dividerColor,
    );

    return InkWell(
      onTap: () {
        makeCommonSenseRead(commonSense.id);
        navigateTo(
          context,
          Routes.senseDetail,
          routeSettings: RouteSettings(
            arguments: commonSense,
          ),
        );
      },
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.only(
          left: Spacing.s,
          right: Spacing.s,
          top: Spacing.m,
          bottom: Spacing.xs,
        ),
        width: double.maxFinite,
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(right: Spacing.m),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commonSense.title,
                      style: titleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: Spacing.m),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            formatDateString(commonSense.createdAt),
                            style: dateStyle,
                          ),
                          Row(
                            children: [
                              if (commonSense.read == 1)
                                const Icon(
                                  Icons.check_circle,
                                  size: Spacing.l,
                                  color: AppColors.green,
                                ),
                              IconButton(
                                onPressed: () async {
                                  await addToLikes(
                                    commonSense.id,
                                    commonSense.liked == 0 ? 1 : 0,
                                  );
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: Spacing.l,
                                  color: commonSense.liked == 1
                                      ? themeData.highlightColor
                                      : themeData.colorScheme.surface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(Spacing.xs),
              // Image border
              child: Image.network(
                commonSense.cover,
                fit: BoxFit.cover,
                width: 120,
                height: 90,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'statics/images/default.jpg',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 90,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
