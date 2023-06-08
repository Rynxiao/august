import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/states/sense_state.dart';

import '../states/global_state.dart';
import '../widgets/custom_appbar.dart';
import 'common_sense.dart';

class SenseLikes extends StatefulWidget {
  const SenseLikes({super.key});

  @override
  State<SenseLikes> createState() => _SenseLikesState();
}

class _SenseLikesState extends State<SenseLikes> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final senseState = Provider.of<SenseState>(context, listen: false);
      senseState.getLikedSenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final senseState = Provider.of<SenseState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);
    var backgroundColor = isDarkMode
        ? themeData.scaffoldBackgroundColor
        : themeData.colorScheme.background;

    return Scaffold(
      appBar: CustomAppBar(
        title: '我的收藏',
        backgroundColor: backgroundColor,
      ),
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: SafeArea(
        child: renderSenseList(
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
    );
  }
}
