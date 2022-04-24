import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logSet/logSet-logic.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

class LogSet extends StatefulWidget {
  final String exerciseId;
  final String todayId;
  const LogSet({Key? key, required this.exerciseId, required this.todayId})
      : super(key: key);

  @override
  _LogSetState createState() => _LogSetState();
}

class _LogSetState extends State<LogSet> {
//
  int repsCount = 0;
  // Object of LogSet Logic
  LogSetLogic _LogSetLogic = new LogSetLogic();
  //
  double weight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.exerciseId);
    print(widget.todayId);
  }

  @override
  Widget build(BuildContext context) {
    //
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(24),
      height: 300,
      child: Column(
        children: [
          // HEading
          Text(
            'Log Your Set',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          // Sized Box
          SizedBox(height: 36),
          NumberPicker(
            axis: Axis.horizontal,
            value: repsCount,
            minValue: 0,
            maxValue: 100,
            onChanged: (value) => setState(() => repsCount = value),
          ),
          CustomNumberPicker(
            initialValue: 0,
            maxValue: 1000,
            minValue: 0,
            step: 0.25,
            onValue: (value) {
              // print(value.toString());
              weight = double.parse(value.toString());
            },
            valueTextStyle: TextStyle(fontSize: 24),
          ),
          Expanded(child: Container()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primaryBgColor,
                minimumSize: Size.fromHeight(
                    40), // fromHeight use double.infinity as width and 40 is the height
                textStyle: TextStyle(fontSize: 24),
                shape: StadiumBorder(),
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
            onPressed: () {
              _LogSetLogic.logSet(widget.exerciseId, widget.todayId, repsCount,
                  weight, context);
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: blackColor,
            ),
          )
        ],
      ),
    );
  }
}
