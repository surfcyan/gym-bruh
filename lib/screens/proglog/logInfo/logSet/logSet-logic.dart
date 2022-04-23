import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/services/firebase.dart';

class LogSetLogic {
// Firebase Object
  FireBaseService fBs = new FireBaseService();

  logSet(String exerciseId, String todayId, int reps, BuildContext context) {
    fBs.appendExerciseSet(exerciseId, todayId, reps).then((value) {
      print('Added Set data');
      Navigator.pop(context);
      // show toast
      Fluttertoast.showToast(
          msg: "Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryBgColor,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }
}
