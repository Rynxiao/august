import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart' as sense;
import 'package:simple_calendar/network/sense.dart';
import 'package:simple_calendar/routes/routes.dart';
import 'package:simple_calendar/states/sense_state.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/widgets/network_image_container.dart';

import '../states/global_state.dart';
import '../utils/date_utils.dart';

class CommonSense extends StatefulWidget {
  final SenseState senseState;

  const CommonSense({super.key, required this.senseState});

  @override
  State<CommonSense> createState() => _CommonSenseState();
}

class _CommonSenseState extends State<CommonSense>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> tabs = [];

  @override
  void initState() {
    super.initState();

    var senseState = widget.senseState;
    var types = senseState.types;
    setState(() {
      tabs = types.map((type) => Tab(text: type.title)).toList();
    });

    senseState.getSenses();

    _tabController = TabController(length: types.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);
    var senseState = widget.senseState;
    var unselectedLabelStyle = themeData.primaryTextTheme.bodyLarge;
    var labelStyle = unselectedLabelStyle?.copyWith(
      fontSize: AppFontSize.medium,
    );
    var backgroundColor = isDarkMode
        ? themeData.scaffoldBackgroundColor
        : themeData.colorScheme.background;

    return Column(
      children: [
        Container(
          color: backgroundColor,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: themeData.primaryColor,
                labelColor: themeData.colorScheme.surface,
                labelStyle: labelStyle,
                unselectedLabelStyle: unselectedLabelStyle,
                labelPadding: const EdgeInsets.only(right: Spacing.l),
                indicatorPadding: const EdgeInsets.only(right: Spacing.l),
                tabs: tabs,
                onTap: (index) {
                  var typeId = widget.senseState.types[index].id;
                  senseState.setType(typeId);
                },
              ),
              const Divider(),
            ],
          ),
        ),
        Expanded(
          child: renderSenseList(
            context,
            senseState.loading,
            senseState.error,
            senseState.senses,
            backgroundColor,
            onUpdateRead: (sense) {
              senseState.updateRead(sense);
            },
            onToggleLike: (sense) {
              senseState.toggleLike(sense);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

Widget renderSenseList(
  BuildContext context,
  bool loading,
  Object? error,
  List<sense.CommonSense> senses,
  Color backgroundColor, {
  required Null Function(sense.CommonSense) onUpdateRead,
  required Null Function(sense.CommonSense) onToggleLike,
}) {
  if (loading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else {
    if (error != null) {
      return const Center(
        child: Text('加载错误，请稍候再试!!!'),
      );
    } else {
      if (senses.isNotEmpty) {
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
                  onUpdateRead: onUpdateRead,
                  onToggleLike: onToggleLike,
                );
              },
              itemCount: senses.length,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Spacing.m),
              child: Text(
                "~ 已经到底了 ~",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: AppFontSize.regular,
                    ),
              ),
            )
          ]),
        );
      } else {
        return const Center(
          child: Text('空空如也!'),
        );
      }
    }
  }
}

Widget _buildSenseItem(
  BuildContext context,
  Color backgroundColor,
  sense.CommonSense commonSense, {
  required Null Function(sense.CommonSense) onUpdateRead,
  required Null Function(sense.CommonSense) onToggleLike,
}) {
  final themeData = Theme.of(context);
  var titleStyle = themeData.primaryTextTheme.titleMedium
      ?.copyWith(color: themeData.colorScheme.surface);
  var dateStyle = themeData.primaryTextTheme.labelLarge?.copyWith(
    color: themeData.dividerColor,
  );

  return InkWell(
    onTap: () {
      makeCommonSenseRead(commonSense.id);
      onUpdateRead(commonSense);
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
                                onToggleLike(commonSense);
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
            child: NetworkImageContainer(
              imageUrl: commonSense.cover,
              width: 120,
              height: 90,
            ),
          ),
        ],
      ),
    ),
  );
}
