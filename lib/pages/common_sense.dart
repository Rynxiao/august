import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart' as sense;
import 'package:simple_calendar/network/sense.dart';
import 'package:simple_calendar/states/sense_state.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';

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
  var typeId = '0';

  @override
  void initState() {
    super.initState();

    var types = widget.senseState.types;
    setState(() {
      typeId = types[0].id;
      tabs = types.map((type) => Tab(text: type.title)).toList();
    });

    _tabController = TabController(length: types.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);
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
                  setState(() {
                    typeId = widget.senseState.types[index].id;
                  });
                },
              ),
              const Divider(),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: typeId == '0'
                ? getCommonSenseByPage()
                : getCommonSenseByTypeId(typeId),
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
      ],
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
      onTap: () {},
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
                                  Icons.fork_right,
                                  size: Spacing.l,
                                ),
                              IconButton(
                                onPressed: () {},
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
                'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
                width: 120,
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
