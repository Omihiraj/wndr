import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/bookpost_data.dart';
import '../../constants/config.dart';

class FindBook extends StatefulWidget {
  const FindBook({super.key});

  @override
  State<FindBook> createState() => _FindBookState();
}

class _FindBookState extends State<FindBook> {
  List<BookPostItem> dashboardItem = const [
    BookPostItem("Find a Tour", 'assets/sigiri.jpg'),
    BookPostItem("Book a hotel", 'assets/hotel.jpg'),
    BookPostItem("Book a Flight", 'assets/flight.jpg'),
    BookPostItem("Book a Activity", 'assets/water.jpg'),
  ];

  Padding buildList() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: screenHeight,
        child: ListView.builder(
          itemCount: dashboardItem.length,
          itemBuilder: (context, index) {
            return buildCard(
              dashboardItem[index].title,
              dashboardItem[index].imgPath,
            );
          },
        ),
      ),
    );
  }

  Padding buildCard(String title, String img) {
    double width = ((MediaQuery.of(context).size.width) - 40);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: width,
        height: 127,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 15,
              bottom: 20,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  width: width - 30,
                  height: 44.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const ImageIcon(
                        AssetImage(
                          "assets/arrow-right.png",
                        ),
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding menu() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          ImageIcon(
            AssetImage(
              "assets/menu.png",
            ),
            color: MainfontColor,
            size: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgrounsColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            menu(),
            buildList(),
          ],
        ),
      ),
    );
  }
}
