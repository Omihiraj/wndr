import 'package:cloud_firestore/cloud_firestore.dart';

class Tour {
  Tour(
      {required this.heroName,
      required this.heroImg,
      required this.heroDes,
      required this.category,
      required this.locName,
      required this.locDes,
      required this.images,
      required this.address,
      required this.location,
      required this.entryPrice,
      this.ratings});
  String heroName;
  String heroDes;
  String heroImg;
  List<String> category;
  String locName;
  String locDes;
  List<String> images;
  String address;
  GeoPoint location;
  double? ratings;
  int entryPrice;

  factory Tour.fromJson(Map<String, dynamic> json) => Tour(
      address: json["address"],
      category: List<String>.from(json["category"].map((x) => x)),
      heroDes: json["hero-description"],
      heroImg: json["hero-img"],
      heroName: json["name"],
      images: List<String>.from(json["images"].map((x) => x)),
      locDes: json["location-description"],
      locName: json["location-name"],
      location: json["google-location"],
      ratings: json["ratings"],
      entryPrice: json["entry-fee"]);

  Map<String, dynamic> toJson() => {
        "name": heroName,
        "hero-description": heroDes,
        "hero-img": heroImg,
        "category": category,
        "location-name": locName,
        "location-description": locDes,
        "google-location": location,
        "address": address,
        "images": images,
        "ratings": ratings,
        "entry-fee": entryPrice
      };
}
