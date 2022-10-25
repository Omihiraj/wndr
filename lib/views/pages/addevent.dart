import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/config.dart';
import 'addtour.dart';

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
