import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoPageScaffold Sample'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('You have pressed the button $_counter times.'),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: CupertinoButton.filled(
                onPressed: () => setState(() => _counter++),
                child: const Icon(CupertinoIcons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}