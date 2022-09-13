import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDb {
  FirebaseFirestore db = FirebaseFirestore.instance;
  //Write an entry into a document within a given collection.
  Future addToDocument({
    required String collection,
    required String document,
    // required Map<String, dynamic> keyValue,
    required Map<String, dynamic> keyValue,
  }) async {
    //Get the document reference
    final docRef = db.collection(collection).doc(document);
    await docRef.set(keyValue, SetOptions(merge: true));
  }
  //Read an entry from a document within a given collection
}
