import 'package:flutter/material.dart';

import '../routes/routes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          const Text("Settings")
        ],
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 1),
    );
  }

}