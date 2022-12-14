import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wndr/constants/config.dart';

import 'pages/explore_activities_page.dart';
import 'pages/explore_all_page.dart';
import 'pages/explore_flights_page.dart';
import 'pages/explore_tours_page.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController textEditingControllerSearch = TextEditingController();
  int index = 0;

  Widget searchFeild() {
    double width = ((MediaQuery.of(context).size.width) - 40);
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: SearchColor, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: textEditingControllerSearch,
          decoration: InputDecoration(
              hintText: "Search",
              labelStyle: GoogleFonts.montserrat(),
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none),
        ),
      ),
    );
  }

  Padding buidNavButtons(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          allButton(width - 150),
          const SizedBox(width: 10),
          toursButton(width - 150),
          const SizedBox(width: 10),
          activitiesButton(width - 150),
          const SizedBox(width: 10),
          flightsButton(width - 150)
        ],
      ),
    );
  }

  InkWell allButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 0;
        });
      },
      child: SizedBox(
        width: 100,
        child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: index == 0 ? MainColor : SearchColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "All",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: index == 0 ? Colors.white : Colors.grey,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )),
      ),
    );
  }

  InkWell toursButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 1;
        });
      },
      child: SizedBox(
        width: 100,
        child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: index == 1 ? MainColor : SearchColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Text(
                "Tours",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: index == 1 ? Colors.white : Colors.grey,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )),
      ),
    );
  }

  InkWell activitiesButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 2;
        });
      },
      child: SizedBox(
        width: 100,
        child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: index == 2 ? MainColor : SearchColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Text(
                "Activities",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: index == 2 ? Colors.white : Colors.grey,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )),
      ),
    );
  }

  InkWell flightsButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 3;
        });
      },
      child: SizedBox(
        width: 100,
        child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: index == 3 ? MainColor : SearchColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Text(
                "Flights",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: index == 3 ? Colors.white : Colors.grey,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Scaffold(
        backgroundColor: BackgrounsColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: BackgrounsColor,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: MainfontColor,
              )),
          title: Text(
            "Bookings",
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: SecondfontColor),
            ),
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              searchFeild(),
              SizedBox(height: 60, child: buidNavButtons(width)),
              index == 0
                  ? const AllPage()
                  : (index == 1
                      ? const ToursPage()
                      : (index == 2 ? const ActiPage() : const FlightPage())),
            ],
          ),
        ));
  }
}
