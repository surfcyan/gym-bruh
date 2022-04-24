import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logInfo-logic.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logSet/logSet.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
    run();
  }

  run() async {
    await _logInfoLogic.getExerciseData(widget.fireId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
//
    final controller =
        PageController(initialPage: _logInfoLogic.exerciseData.length - 1);
    //
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
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    // print(value);
                    setState(() {
                      _logInfoLogic
                          .generateGraph(_logInfoLogic.exerciseData[value]);
                    });
                  },
                  children: [
                    for (var item in _logInfoLogic.exerciseData)
                      Container(
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Text(
                              _logInfoLogic.getDateText(DateTime.parse(
                                  item.timestamp.toDate().toString())),
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 24),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                                child: Container(
                              child: charts.BarChart(
                                _logInfoLogic
                                    .seriesList, // Set a bar label decorator.
                                defaultRenderer: new charts.BarRendererConfig(
                                    cornerStrategy:
                                        const charts.ConstCornerStrategy(30)),
                                animate: true,
                                vertical: true,
                              ),
                            ))
                            // Container(
                            //   color: Colors.red,
                            //   child: charts.BarChart(
                            //     _logInfoLogic
                            //         .seriesList, // Set a bar label decorator.
                            //     defaultRenderer: new charts.BarRendererConfig(
                            //         cornerStrategy:
                            //             const charts.ConstCornerStrategy(30)),
                            //     animate: true,
                            //     vertical: true,
                            //   ),
                            // )
                          ],
                        ),
                      )
                    // Column(
                    //   children: [
                    //     // Text(
                    //     //     DateTime.parse(item.timestamp.toDate().toString())
                    //     //         .day
                    //     //         .toString()),
                    //     charts.BarChart(
                    //       _logInfoLogic
                    //           .seriesList, // Set a bar label decorator.
                    //       defaultRenderer: new charts.BarRendererConfig(
                    //           cornerStrategy:
                    //               const charts.ConstCornerStrategy(30)),
                    //       animate: true,
                    //       vertical: true,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
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
                                run();
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
          ],
        ),
      ),
    );
  }

  num? measureFn(datum, int? index) {
    return 0;
  }

  String measureFnO(datum, int? index) {
    return '0';
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
