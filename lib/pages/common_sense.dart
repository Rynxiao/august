import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../states/global_state.dart';

class CommonSense extends StatefulWidget {
  const CommonSense({super.key});

  @override
  State<CommonSense> createState() => _CommonSenseState();
}

class _CommonSenseState extends State<CommonSense>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
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
                tabs: const [
                  Tab(text: '最新'),
                  Tab(text: '生活'),
                  Tab(text: '医学'),
                  Tab(text: '45435435'),
                  Tab(text: '5654645654'),
                  Tab(text: '67657657'),
                  Tab(text: '72432423432'),
                ],
                onTap: (index) {
                  _tabController.index = index;
                },
              ),
              const Divider(),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildSenseItem(context, backgroundColor);
                  },
                  itemCount: 10,
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSenseItem(BuildContext context, Color backgroundColor) {
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
          bottom: Spacing.xs
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
                  children: [
                    Text(
                      '如果遇到人晕倒，应该先检查他们的呼吸和脉搏是否正常,检查他们的呼吸和脉搏是否正',
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
                            '09-12',
                            style: dateStyle,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.fork_right,
                                size: Spacing.l,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  size: Spacing.l,
                                  color: themeData.highlightColor,
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
