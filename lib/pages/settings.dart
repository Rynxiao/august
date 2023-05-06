import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../routes/routes.dart';
import '../states/global_state.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;

    return CustomScaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.sunny),
                title: Text(isDarkMode ? '暗黑模式' : '明亮模式'),
                trailing: Switch(
                  value: globalState.isDarkMode,
                  onChanged: (bool value) {
                    globalState.toggleTheme();
                  },
                ),
                onTap: () {
                  // TODO: navigate to profile page
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 1),
    );
  }

}