import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/config.dart';

class AddEvent extends StatefulWidget {
  String heroName;
  String description;
  List<String> catList;
  File heroImg;

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
  List<XFile>? images;
  TextFormField location() {
    return TextFormField(
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
      maxLines: 5,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    );
  }

  TextFormField address() {
    return TextFormField(
      maxLines: 3,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    );
  }

  TextFormField entryfee() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    );
  }

  Center savebtn() {
    return Center(
      child: SizedBox(
        width: 270,
        height: 50,
        child: MaterialButton(
          onPressed: () {},
          color: MainColor,
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            'Save and Close',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
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

  Widget galleryImg() {
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

  @override
  Widget build(BuildContext context) {
    print(widget.heroName);
    print(widget.catList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BackgrounsColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Location",
                style: TextStyle(
                  color: SecondfontColor,
                  fontFamily: 'WorkSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              location(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Description",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: SecondfontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              description(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Address",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: SecondfontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              address(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Gallery",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: SecondfontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              galleryImg(),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Entry fee",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: SecondfontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}
