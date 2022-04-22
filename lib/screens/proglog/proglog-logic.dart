import 'package:flutter/material.dart';
import 'package:gym_bruh/services/firebase.dart';

class ProgLogLogic {
  List logList = [];

  getList() {
    return [
      {'title': 'Chest Press'},
      {'title': 'Sholder Press'},
      {'title': 'Dumbell Press'},
      {'title': 'Chest Press'},
      {'title': 'Sholder Press'},
      {'title': 'Dumbell Press'},
    ];
  }

  fetchLogs() async {
    FireBaseService fBs = new FireBaseService();
    logList = await fBs.getProglogDataSnapshot();
  }
}
