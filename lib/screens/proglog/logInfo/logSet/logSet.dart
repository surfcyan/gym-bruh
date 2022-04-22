import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logSet/logSet-logic.dart';

class LogSet extends StatefulWidget {
  const LogSet({Key? key}) : super(key: key);

  @override
  _LogSetState createState() => _LogSetState();
}

class _LogSetState extends State<LogSet> {
  // Object of LogSet Logic
  LogSetLogic _LogSetLogic = new LogSetLogic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 300,
      child: Column(
        children: [
          // HEading
          Text(
            'Add New Exercise',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          // Sized Box
          SizedBox(height: 36),
        ],
      ),
    );
  }
}
