import 'package:flutter/material.dart';
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

  Container buildCard(String title, String img) {
    double width = ((MediaQuery.of(context).size.width) - 40);
    return Container(
      width: width,
      height: 150,
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
            left: 40,
            bottom: 20,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                width: width - 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgrounsColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BackgrounsColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              buildList(),
            ],
          ),
        ),
      ),
    );
  }
}
