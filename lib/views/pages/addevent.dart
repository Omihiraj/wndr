import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/config.dart';

import 'addtour.dart';

import '../../services/fire_service.dart';


class AddEvent extends StatefulWidget {
  String heroName;
  String description;
  List<String> catList;
  String heroImg;

  AddEvent(
      {super.key,
      required this.heroName,
      required this.description,
      required this.catList,
      required this.heroImg});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController locName = TextEditingController();
  TextEditingController locDes = TextEditingController();
  TextEditingController locAddrs = TextEditingController();
  TextEditingController entryFee = TextEditingController();
  List<String>? galleryImgsUrl;
  List<XFile>? images;
  UploadTask? task;
  TextFormField location() {
    return TextFormField(
      controller: locName,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.location_on,
          color: MainColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  TextFormField description() {
    return TextFormField(
      controller: locDes,
      maxLines: 5,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    );
  }

  TextFormField address() {
    return TextFormField(
      controller: locAddrs,
      maxLines: 3,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    );
  }

  TextFormField entryfee() {
    return TextFormField(
      controller: entryFee,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    );
  }

  popuMessage(String displayMsg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning, color: Colors.redAccent),
              const SizedBox(width: 10),
              Text(
                displayMsg,
                style: const TextStyle(color: Colors.redAccent),
              )
            ],
          ));
        });
  }

  Center savebtn() {
    return Center(
      child: SizedBox(
        width: 270,
        height: 50,
        child: MaterialButton(
          onPressed: () {
            if (locName.text.trim().isEmpty) {
              popuMessage("Please Enter Location Name");
            } else if (locDes.text.trim().isEmpty) {
              popuMessage("Please Enter Location Description");
            } else if (locAddrs.text.trim().isEmpty) {
              popuMessage("Please Enter Location Address");
            } else if (entryFee.text.trim().isEmpty) {
              popuMessage("Please Enter Entree Fee");
            }  else {
              FireService.addTour(
                context: context,
                  heroName: widget.heroName,
                  heroImg: widget.heroImg,
                  heroDes: widget.description,
                  category: widget.catList,
                  locationName: locName.text.trim(),
                  locationDes: locDes.text.trim(),
                  location: GeoPoint(2.1, 2.1),
                  address: locAddrs.text.trim(),
                  images: [""],
                  entryPrice: int.parse(entryFee.text.trim()));
            }
          },
          color: MainColor,
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            'Save and Close',
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final List<XFile>? images = await ImagePicker().pickMultiImage();
      if (images == null) return;

      setState(() {
        this.images = images;
      });
    } on PlatformException catch (e) {
      print("Falied to pick image : $e");
    }
  }

  Widget uploadBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          uploadFile();
        },
        child: Container(
          width: 100,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text("Upload", style: TextStyle(color: Colors.white)),
            Icon(Icons.upload, color: Colors.white)
          ]),
        ),
      ),
    );
  }

  Future uploadFile() async {
    if (images!.isEmpty) return;
    for (int i = 0; i < images!.length; i++) {
      final destination = "images/${images![i].path}";
      task = FireService.uploadImg(destination, File(destination));
      // if (task == null) return;
      // final snapshot = await task!.whenComplete(() => () {});
      // final urlDownload = await snapshot.ref.getDownloadURL();
      // setState(() {
      //   galleryImgsUrl![i] = urlDownload;
      // });
      // print(urlDownload);

    }
  }

  Widget galleryImg() {
    return DottedBorder(
      color: Colors.grey,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: InkWell(
          onTap: () {
            pickImage();
          },
          child: Container(
            height: 180,
            width: double.infinity,
            color: Colors.grey[200],
            child: images != null
                ? GridView.builder(
                    itemCount: images!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemBuilder: (context, int index) {
                      return Image.file(File(images![index].path));
                    })
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.file_copy,
                        color: MainColor,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Choose file here...",
                        style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: SecondfontColor),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "(Max file size: 50mb)",
                        style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.heroName);
    print(widget.catList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BackgrounsColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTour()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "Location",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              location(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              description(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Address",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              address(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Gallery",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              galleryImg(),
              const SizedBox(
                height: 20,
              ),
              Text(

              uploadBtn(),
              const SizedBox(
                height: 5,
              ),
              const Text(

                "Entry fee",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              entryfee(),
              const SizedBox(
                height: 20,
              ),
              savebtn(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
