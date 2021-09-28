import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logInfo-logic.dart';

class LogInfo extends StatefulWidget {
  const LogInfo({Key? key}) : super(key: key);

  @override
  _LogInfoState createState() => _LogInfoState();
}

class _LogInfoState extends State<LogInfo> {
  // Object of Loginfo Logic
  LogInfoLogic _logInfoLogic = new LogInfoLogic();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        // Try removing opacity to observe the lack of a blur effect and of sliding content.
        backgroundColor: CupertinoColors.black,
        middle: const Text('Exercises'),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            // Set Counter
            Row(
              children: [
                AnimatedFlipCounter(
                  prefix: "Set ",
                  duration: Duration(milliseconds: 500),
                  value: _logInfoLogic.value, // pass in a value like 2014
                  textStyle: TextStyle(color: Colors.black, fontSize: 36),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _logInfoLogic.value += 1;
                    });
                  },
                  child: const Text('Inclrease'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
