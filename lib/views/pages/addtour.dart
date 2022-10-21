import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wndr/services/fire_service.dart';

import '../../components/components.dart';
import '../../constants/config.dart';
import 'addevent.dart';

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
            Radius.circular(7.0),
          ),
        ),
      ),
    );
  }

  Widget categoryList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(20),
                      child: Row(children: [
                        Text(
                          catList[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(Icons.add_circle_rounded,
                            color: Colors.white)
                      ]),
                    ),
                  ),
                );
              })),
    );
  }

  Widget categoryBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(8),
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
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  Widget heroImg() {
    return DottedBorder(
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
            height: 200,
            width: double.infinity,
            color: Colors.grey[200],
            child: image != null
                ? Image.file(
                    image!,
                    width: double.infinity,
                  )
                : Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Select Image"),
                      Icon(Icons.add_a_photo_outlined)
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey,
        ),
        centerTitle: true,
        title: const Text(
          'Add a Tour',
          style: TextStyle(
            color: SecondfontColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Name",
                style: TextStyle(
                    color: SecondfontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 5),
              name(),
              const SizedBox(height: 20),
              const Text(
                "Categories",
                style: TextStyle(
                    color: SecondfontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 5),
              categoryBox(),
              categoryList(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hero Image",
                style: TextStyle(
                  color: SecondfontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
              const Text(
                'Description',
                style: TextStyle(
                  color: SecondfontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
