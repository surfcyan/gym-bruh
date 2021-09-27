import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_bruh/screens/proglog/proglog-logic.dart';
import 'package:simple_moment/simple_moment.dart';

/// This is the stateful widget that the main application instantiates.
class ProgLog extends StatefulWidget {
  const ProgLog({Key? key}) : super(key: key);

  @override
  State<ProgLog> createState() => _ProgLog();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ProgLog extends State<ProgLog> {
  // Prog Logic
  ProgLogLogic _progLogLogic = new ProgLogLogic();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: new SliverChildListDelegate([
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(18, 24, 18, 24),
                          height: 600,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xFFc3ff40), Color(0xFFffb632)]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 12),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Back Icon
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      size: 28,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                              // Spacing
                              SizedBox(
                                height: 24,
                              ),
                              // Calander "Today"
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Today',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              // Calander Date Month
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${Moment.now().format("dd MMMM")}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Spacing
                              SizedBox(
                                height: 48,
                              ),
                              // White button
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 24),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.add_outlined,
                                    color: Colors.grey,
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              // Past Logs List
              for (var each in _progLogLogic.getList())
                Container(
                  padding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                  child: Text(
                    each['title'],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
            ])),
          ],
        ),
      ),
    );
  }
}
