import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class ProgLog extends StatefulWidget {
  const ProgLog({Key? key}) : super(key: key);

  @override
  State<ProgLog> createState() => _ProgLog();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ProgLog extends State<ProgLog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        // Try removing opacity to observe the lack of a blur effect and of sliding content.
        backgroundColor: CupertinoColors.black,
        middle: const Text('Progression Log'),
      ),
      child: Container(
        child: Center(
          child: Text('Page Two'),
        ),
      ),
    );
  }
}
