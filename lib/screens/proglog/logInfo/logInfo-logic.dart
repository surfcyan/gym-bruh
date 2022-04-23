import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_bruh/services/firebase.dart';

class LogInfoLogic {
  double value = 0;
  // Firebase Object
  FireBaseService fBs = new FireBaseService();
  //
  List pastData = [];
  //
  String todayId = '';

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
      fBs.postExerciseLogData(dataJson, id);
      getExerciseData(id);
    } else {}
    print(pastData);
  }
}
