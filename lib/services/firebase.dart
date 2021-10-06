import 'package:cloud_firestore/cloud_firestore.dart';

addData() {
  Map<String, dynamic> demoData = {'Name': 'Kartik'};
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('data');
  collectionReference.add(demoData);
}
