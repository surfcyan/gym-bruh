import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/screens/exercises/exercises.dart';
import 'package:gym_bruh/screens/proglog/proglog.dart';
import 'package:gym_bruh/services/health.dart';
import 'package:health/health.dart';

class ProfileLogic {
  HealthService _hS = new HealthService();
  double distance = 0;
  int? steps = 0;

  connectHealth() async {
    bool res = await _hS.requestHealthPerms();
    if (res) {
      Fluttertoast.showToast(
          msg: "Permission Granted!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryBgColor,
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Please Grant Permissions!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryBgColor,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  fetchSteps() async {
    steps = await _hS.getTotalStepsToday();
  }

  fetchDistance() async {
    distance = await _hS.getTotalDistanceToday();
  }
}
