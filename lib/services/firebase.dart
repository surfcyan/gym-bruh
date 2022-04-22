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
      FirebaseFirestore.instance.collection('data');

  /// Get snapshot of data from firestore
  // getProglogDataSnapshot() async {
  //   var data = [];
  //   // progLogCollectionReference.snapshots().listen((snapshot) {
  //   //   print(snapshot.docs);
  //   //   snapshot.docs.forEach((element) {
  //   //     data.add(element.data());
  //   //   });
  //   // });
  //   // return data;
  //   // Retrieve only the first snapshot. There's no need to listen to it.
  //   print(data);
  //   DocumentSnapshot snapshot =
  //       await progLogCollectionReference.doc().snapshots().;
  //   print(data);
  //   return data;
  // }

  Future getProglogDataSnapshot() async {
    var querySnapshot = await progLogCollectionReference.get();
    List data = [];
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      data.add(queryDocumentSnapshot.data());
    }
    return data;
  }

  Future postPogLogData(var dataJson) async {
    var querySnapshot = await progLogCollectionReference.add(dataJson);
    return querySnapshot;
  }
}
