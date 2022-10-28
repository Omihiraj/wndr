import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:wndr/services/fire_service.dart';

import '../../components/components.dart';
import '../../constants/config.dart';
import 'addevent.dart';
import 'cc/cc_dashboard.dart';

class AddTour extends StatefulWidget {
  const AddTour({super.key});

  @override
  State<AddTour> createState() => _AddTourState();
}

class _AddTourState extends State<AddTour> {
  final nameController = TextEditingController();
  final descripController = TextEditingController();
  String? heroImgUrl;
  File? image;
  UploadTask? task;
  List<String> catList = [
    "Science",
    "Adventure",
    "Science & Art",
    "Cultural",
    "Technology"
  ];
  List<String> selectedCatList = [];
  TextFormField name() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Widget categoryList() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCatList.add(catList[index]);
                        catList.removeAt(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(20),
                      child: Row(children: [
                        Text(
                          catList[index],
                          style: GoogleFonts.workSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.add_circle_rounded,
                          color: Colors.white,
                          size: 16,
                        )
                      ]),
                    ),
                  ),
                );
              })),
    );
  }

  Widget categoryBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey)),
        width: double.infinity,
        height: 200,
        //padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: selectedCatList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCatList[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            catList.add(selectedCatList[index]);
                            selectedCatList.remove(selectedCatList[index]);
                          });
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  TextFormField description() {
    return TextFormField(
      controller: descripController,
      maxLines: 5,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  Widget heroImg() {
    return DottedBorder(
      color: Colors.grey,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(7),
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
            child: image != null
                ? Image.file(
                    image!,
                    width: double.infinity,
                  )
                : Center(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Falied to pick image : $e");
    }
  }

  Center nextBtn({context, required String btnText}) {
    return Center(
      child: SizedBox(
        width: 270,
        height: 50,
        child: MaterialButton(
          onPressed: () {
            if (nameController.text.trim().isEmpty) {
              popuMessage("Please Enter Name");
            } else if (descripController.text.trim().isEmpty) {
              popuMessage("Please Enter Description");
            } else if (selectedCatList.isEmpty) {
              popuMessage("Please Select Atleast One Category ");
            } else if (heroImgUrl == null) {
              popuMessage("Please Upload Image ");
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEvent(
                            heroName: nameController.text.trim(),
                            description: descripController.text.trim(),
                            catList: selectedCatList,
                            heroImg: heroImgUrl!,
                          )));
            }
          },
          color: MainColor,
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            btnText,
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
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
    // return Fluttertoast.showToast(
    //     msg: displayMsg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.redAccent,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  Widget uploadBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          uploadFile();
        },
        child: Container(
          width: 120,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Upload",
              style: GoogleFonts.workSans(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.upload, color: Colors.white)
          ]),
        ),
      ),
    );
  }

  Future uploadFile() async {
    if (image == null) return;
    final destination = "images/${image!.path}";
    task = FireService.uploadImg(destination, image!);
    if (task == null) return;
    final snapshot = await task!.whenComplete(() => () {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      heroImgUrl = urlDownload;
    });
    print(urlDownload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgrounsColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BackgrounsColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ContentCreator()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey,
        ),
        centerTitle: true,
        title: Text(
          'Add a Tour',
          style: GoogleFonts.workSans(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: SecondfontColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Name",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              name(),
              const SizedBox(height: 20),
              Text(
                "Categories",
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              categoryBox(),
              categoryList(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Hero Image",
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
              heroImg(),
              const SizedBox(
                height: 20,
              ),
              uploadBtn(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Description',
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
              nextBtn(context: context, btnText: "Next"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
