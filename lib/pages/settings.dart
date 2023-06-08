import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/theme/spacing.dart';
import 'package:simple_calendar/widgets/weather/weather_icon.dart';

import '../routes/routes.dart';
import '../states/global_state.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Spacing.s),
              color: themeData.colorScheme.background,
            ),
            margin: const EdgeInsets.all(Spacing.m),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: WeatherIcon(
                    color: themeData.colorScheme.onSecondary,
                    name: '${isDarkMode ? '150' : '100'}-fill',
                    size: isDarkMode ? 20 : 24,
                  ),
                  title: Text(isDarkMode ? '暗黑模式' : '明亮模式'),
                  trailing: Switch(
                    value: globalState.isDarkMode,
                    onChanged: (bool value) {
                      globalState.toggleTheme();
                    },
                  ),
                ),
                const Divider(
                  indent: Spacing.m,
                ),
                ListTile(
                  enabled: false,
                  leading: Icon(
                    Icons.backup,
                    color: themeData.colorScheme.onSecondary,
                  ),
                  title: const Text('数据备份'),
                  trailing: Icon(
                    Icons.sync,
                    color: themeData.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Spacing.s),
              color: themeData.colorScheme.background,
            ),
            margin: const EdgeInsets.only(
                left: Spacing.m,
                right: Spacing.m,
                bottom: Spacing.m
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    navigateTo(context, Routes.about);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: themeData.colorScheme.onSecondary,
                    ),
                    title: const Text('关于'),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: themeData.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
