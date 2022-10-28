import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wndr/constants/config.dart';

import '../../models/explore_all_data.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  List<ExplorAllItem> dashboardItem = const [
    ExplorAllItem("Sigiriya", 'assets/sigiri.jpg', "Sri Lanka"),
    ExplorAllItem("Sigiriya", 'assets/sigiri.jpg', "Sri Lanka"),
    ExplorAllItem("Sigiriya", 'assets/sigiri.jpg', "Sri Lanka"),
    ExplorAllItem("Sigiriya", 'assets/sigiri.jpg', "Sri Lanka"),
  ];

  Padding buildList() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: screenHeight * 0.65,
        child: ListView.builder(
          itemCount: dashboardItem.length,
          itemBuilder: (context, index) {
            return buildCard(
              dashboardItem[index].title,
              dashboardItem[index].imgPath,
              dashboardItem[index].location,
            );
          },
        ),
      ),
    );
  }

  Container buildCard(String title, String img, String location) {
    double width = ((MediaQuery.of(context).size.width) - 40);
    return Container(
      width: width,
      height: 189,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 20,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(230, 255, 255, 255)),
                width: width - 30,
                height: 66,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: SecondfontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const ImageIcon(
                                AssetImage(
                                  "assets/location.png",
                                ),
                                color: MainfontColor,
                                size: 11,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                location,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: MainColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: MainColor,
                        size: 14,
                      ),
                    ],
                  ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildList(),
        ],
      ),
    );
  }
}
