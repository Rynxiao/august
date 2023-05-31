import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_appbar.dart';
import '../routes/routes.dart';
import '../states/global_state.dart';

class CommonSense extends StatelessWidget {
  const CommonSense({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: '小常识',
        automaticallyImplyLeading: false,
        backgroundColor: themeData.scaffoldBackgroundColor,
      ),
      body: const SafeArea(
        child: Center(
          child: Text('小常识'),
        )
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 2),
    );
  }
}
