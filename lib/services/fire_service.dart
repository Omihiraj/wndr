import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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

  static Future addTour({
    required context,
    required String heroName,
    required List<String> category,
    required String heroImg,
    required String heroDes,
    required GeoPoint location,
    required String locationName,
    required String locationDes,
    required String address,
    required List<String> images,
    required int entryPrice,
  }) async {
    final String tourDocId =
        FirebaseFirestore.instance.collection("tours").doc().id;
    final tourDoc =
        FirebaseFirestore.instance.collection("tours").doc(tourDocId);
    final tourItem = Tour(
        heroName: heroName,
        category: category,
        heroImg: heroImg,
        heroDes: heroDes,
        location: location,
        locName: locationName,
        locDes: locationDes,
        address: address,
        images: images,
        entryPrice: entryPrice);

    final json = tourItem.toJson();
    await tourDoc.set(json).then((value) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                content: SizedBox(
              height: 300,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.warning, color: Colors.redAccent),
                      SizedBox(width: 10),
                      Text(
                        "Success",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: Text("Ok")),
                  )
                ],
              ),
            ));
          });
    }).catchError((error) {
      print("Some Error Occured");
    });
  }
}
