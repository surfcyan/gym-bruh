import 'package:flutter/material.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/services/firebase.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddExerciseLogic {
  FireBaseService fBs = new FireBaseService();

  Future<bool> addNewLog(String name, BuildContext context) async {
    await fBs.postPogLogData({'Name': name}).then((value) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryBgColor,
          textColor: Colors.black,
          fontSize: 16.0);
      return true;
    });
    return false;
  }
}
