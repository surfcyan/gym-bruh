import 'package:gym_bruh/services/firebase.dart';

class LogInfoLogic {
  double value = 0;
  // Firebase Object
  FireBaseService fBs = new FireBaseService();
  //
  List pastData = [];

  getExerciseData(String id) async {
    pastData = await fBs.getExerciseLogSnapshot(id);
    print(pastData);
  }
}
