import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future appendExerciseSet(String exerciseId, String todayId, int reps) async {
    var querySnapshot = await progLogCollectionReference
        .doc(exerciseId)
        .collection('logs')
        .doc(todayId)
        .update({
      'rps': FieldValue.arrayUnion([reps])
    });
    return querySnapshot;
  }
}
