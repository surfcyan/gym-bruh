import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_bruh/screens/proglog/logInfo/logSet/logSet-logic.dart';

// addData() {
//   Map<String, dynamic> demoData = {'Name': 'Kartik'};
//   CollectionReference collectionReference =
//       FirebaseFirestore.instance.collection('data');
//   collectionReference.add(demoData);
// }

// getDate() {
// // Map<String, dynamic> demoData = {'Name': 'Kartik'};
//   CollectionReference collectionReference =
//       FirebaseFirestore.instance.collection('data');
//   collectionReference.snapshots().listen((data) {
//     print(data.docs[0].data());
//   });
// }

class FireBaseService {
  CollectionReference progLogCollectionReference =
      FirebaseFirestore.instance.collection('exercise-data');

  Future getProglogDataSnapshot() async {
    var querySnapshot = await progLogCollectionReference.get();
    List data = [];
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      data.add({
        'id': queryDocumentSnapshot.id,
        'data': queryDocumentSnapshot.data()
      });
    }
    return data;
  }

  Future postPogLogData(var dataJson) async {
    var querySnapshot = await progLogCollectionReference.add(dataJson);
    return querySnapshot;
  }

  Future<List> getExerciseLogSnapshot(String id) async {
    var querySnapshot =
        await progLogCollectionReference.doc(id).collection('logs').get();
    List data = [];
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      data.add({
        'id': queryDocumentSnapshot.id,
        'data': queryDocumentSnapshot.data()
      });
    }
    return data;
  }

  Future postExerciseLogData(var dataJson, String exerciseId) async {
    var querySnapshot = await progLogCollectionReference
        .doc(exerciseId)
        .collection('logs')
        .add(dataJson);
    // var querySnapshot = await progLogCollectionReference.add(dataJson);
    return querySnapshot;
  }

  Future appendExerciseSet(
      String exerciseId, String todayId, SetObject setObject) async {
    var querySnapshot = await progLogCollectionReference
        .doc(exerciseId)
        .collection('logs')
        .doc(todayId);
    print('object');
    var existingDataObj = await querySnapshot.get();
    var data = existingDataObj.data();
    List rps = data?['rps'];
    rps.add(setObject.reps);
    List weight = data?['weight'];
    weight.add(setObject.weight);
    var obj = {'rps': rps, 'unit': setObject.unit, 'weight': weight};
    await querySnapshot.update(obj);
    return querySnapshot;
  }

  Future deleteExercise(String id) async {
    var querySnapshot = await progLogCollectionReference.doc(id);
    querySnapshot.delete();
    return querySnapshot;
  }
}
