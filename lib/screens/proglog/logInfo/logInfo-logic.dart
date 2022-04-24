import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_bruh/services/firebase.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LogInfoLogic {
  double value = 0;
  // Firebase Object
  FireBaseService fBs = new FireBaseService();
  //
  List pastData = [];
  //
  String todayId = '';
  //
  late List<charts.Series<dynamic, String>> seriesList = [];
  //
  List<ExerciseData> exerciseData = [];

  getExerciseData(String id) async {
    pastData = await fBs.getExerciseLogSnapshot(id);
    for (var item in pastData) {
      var fetchedDate =
          DateTime.parse(item['data']['timestamp'].toDate().toString());
      var today = new DateTime.now();
      if (fetchedDate.day == today.day &&
          fetchedDate.month == today.month &&
          fetchedDate.year == today.year) {
        print('It is today');
        // Set today Id
        todayId = item['id'];
      } else {
        // Create new document for today
        print('not today');
      }
    }
    if (todayId == '') {
      var dataJson = {
        'rps': [],
        'timestamp': new DateTime.now(),
        'unit': 'nos'
      };
      await fBs.postExerciseLogData(dataJson, id);
      getExerciseData(id);
    } else {
      for (var item in pastData) {
        exerciseData.add(ExerciseData(
            item['data']['rps'],
            item['data']['timestamp'],
            item['data']['unit'],
            [10.0, 8.1, 6.1, 10.0, 8.1, 6.1]));
      }
      seriesList = generateGraph(exerciseData[exerciseData.length - 1]);
    }
    return seriesList;
  }

  generateGraph(ExerciseData data) {
    value = data.reps.length.toDouble();
    print(data.reps);
    List<RepsData> repsData = [];
    for (var i = 0; i < data.reps.length; i++) {
      repsData.add(RepsData(data.reps[i], (i + 1).toString(), data.weight[i]));
    }
    seriesList = [
      charts.Series<RepsData, String>(
          id: 'Sales',
          domainFn: (RepsData data, _) => data.count,
          measureFn: (RepsData data, _) => data.value,
          data: repsData)
    ];
    return seriesList;
  }

  getDateText(DateTime time) {
    print(time);
    return time.day.toString() +
        ' ' +
        getMonth(time.month) +
        ' ' +
        time.year.toString();
  }

  getMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
        break;
      case 2:
        return 'Feb';
        break;
      case 3:
        return 'Mar';
        break;
      case 4:
        return 'Apr';
        break;
      case 5:
        return 'May';
        break;
      case 6:
        return 'Jun';
        break;
      case 7:
        return 'Jul';
        break;
      case 8:
        return 'Aug';
        break;
      case 9:
        return 'Sep';
        break;
      case 10:
        return 'Oct';
        break;
      case 11:
        return 'Nov';
        break;
      case 12:
        return 'Dec';
        break;
      default:
        return '';
    }
  }
}

class ExerciseData {
  final List reps;
  final Timestamp timestamp;
  final String unit;
  final List weight;
  ExerciseData(this.reps, this.timestamp, this.unit, this.weight);
}

class RepsData {
  final int value;
  final String count;
  final double weight;
  RepsData(this.value, this.count, this.weight);
}
