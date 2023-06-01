import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/global_state.dart';

class CommonSense extends StatefulWidget {
  const CommonSense({super.key});

  @override
  State<CommonSense> createState() => _CommonSenseState();
}

class _CommonSenseState extends State<CommonSense> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);

    return TabBarView(
      controller: _tabController,
      children: const [
        Center(child: Text('Tab 1')),
        Center(child: Text('Tab 2')),
        Center(child: Text('Tab 3')),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
