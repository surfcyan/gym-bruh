import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logInfo-logic.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logSet/logSet.dart';
import 'package:numberpicker/numberpicker.dart';

class LogInfo extends StatefulWidget {
  final String exercise;
  final String fireId;

  const LogInfo({Key? key, required this.exercise, required this.fireId})
      : super(key: key);

  @override
  _LogInfoState createState() => _LogInfoState();
}

class _LogInfoState extends State<LogInfo> {
  int _currentValue = 3;
  // Object of Loginfo Logic
  LogInfoLogic _logInfoLogic = new LogInfoLogic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.fireId);
    _logInfoLogic.getExerciseData(widget.fireId);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        // Try removing opacity to observe the lack of a blur effect and of sliding content.
        backgroundColor: CupertinoColors.black,
        middle: Text(
          widget.exercise,
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(6),
                // color: primaryBgColor,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Icon(Icons.menu),
                    //   style: ButtonStyle(
                    //     shape: MaterialStateProperty.all(CircleBorder()),
                    //     padding: MaterialStateProperty.all(EdgeInsets.all(32)),
                    //     backgroundColor: MaterialStateProperty.all(
                    //         Colors.blue), // <-- Button color
                    //     overlayColor:
                    //         MaterialStateProperty.resolveWith<Color?>((states) {
                    //       if (states.contains(MaterialState.pressed))
                    //         return Colors.red; // <-- Splash color
                    //     }),
                    //   ),
                    // ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return LogSet(
                                      exerciseId: widget.fireId,
                                      todayId: _logInfoLogic.todayId);
                                }).then((value) {
                              setState(() {
                                _logInfoLogic.value += 1;
                              });
                              print('closed');
                            });
                          },
                          child: Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 12),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        AnimatedFlipCounter(
                          // prefix: "Set ",
                          duration: Duration(milliseconds: 500),
                          value:
                              _logInfoLogic.value, // pass in a value like 2014
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              decoration: TextDecoration.none),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _logInfoLogic.value -= 1;
                            });
                          },
                          child: Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 12),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            )

            //   NumberPicker(
            //     value: _currentValue,
            //     minValue: 0,
            //     maxValue: 100,
            //     onChanged: (value) => setState(() => _currentValue = value),
            //   ),
            //   Text('Current value: $_currentValue'),

            //   // Set Counter
            //   Row(
            //     children: [
            //       AnimatedFlipCounter(
            //         prefix: "Set ",
            //         duration: Duration(milliseconds: 500),
            //         value: _logInfoLogic.value, // pass in a value like 2014
            //         textStyle: TextStyle(color: Colors.black, fontSize: 36),
            //       ),
            //       ElevatedButton(
            //         onPressed: () {
            //           setState(() {
            //             _logInfoLogic.value += 1;
            //           });
            //         },
            //         child: const Text('Inclrease'),
            //       ),
            //     ],
            //   )
          ],
        ),
      ),
    );
  }
}
