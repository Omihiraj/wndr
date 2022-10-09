import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wndr/models/tour.dart';

class FireService {
  static Stream<List<Tour>> getTours() => FirebaseFirestore.instance
      .collection('tours')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Tour.fromJson(doc.data())).toList());

  static UploadTask? uploadImg(String destination, File file) {
    try {
      final storageRef = FirebaseStorage.instance.ref(destination);
      return storageRef.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
