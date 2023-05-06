import 'package:flutter/material.dart';

import '../components/custom_scaffold.dart';
import '../routes/routes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Settings")
          ],
        ),
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 1),
    );
  }

}