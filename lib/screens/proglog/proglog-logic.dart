import 'package:flutter/material.dart';
import 'package:gym_bruh/services/firebase.dart';

class ProgLogLogic {
  List logList = [];
  FireBaseService fBs = new FireBaseService();

  fetchLogs() async {
    logList = [];
    logList = await fBs.getProglogDataSnapshot();
  }

  Future deleteExercise(String id) async {
    await fBs.deleteExercise(id).then((value) {
      return true;
    });
    return false;
  }
}
