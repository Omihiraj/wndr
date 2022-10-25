import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wndr/models/tour.dart';
import 'package:wndr/services/fire_service.dart';
import '../components/components.dart';
import '../constants/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int catIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgrounsColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ImageIcon(
                    AssetImage(
                      "assets/menu.png",
                    ),
                    color: MainfontColor,
                    size: 30,
                  ),
                  ImageIcon(
                    AssetImage(
                      "assets/notifications.png",
                    ),
                    color: MainColor,
                    size: 25,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 2.0, left: 8.0, right: 8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Discover ',
                    style: GoogleFonts.workSans(
                      textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'Chicago',
                        style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: MainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 2.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: Text(
                  "Explore the best places in the world",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    catItem("All", 0),
                    catItem("Art & Culture", 1),
                    catItem("Adventure", 2),
                    catItem("Science", 3),
                    catItem("Sports", 4),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder<List<Tour>>(
                  stream: FireService.getTours(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          if (snapshot.data == null) {
                            return const Text('No data to show');
                          } else {
                            final tours = snapshot.data!;
                            if (tours.isEmpty) {
                              return const Center(child: Text("No Data Found"));
                            }
                            return Container(
                              height: 270,
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: tours.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return tourCard(tours[index]);
                                },
                              ),
                            );
                          }
                        }
                    }
                  }),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 4.0, left: 16.0, right: 32.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Atraction",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: SecondfontColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: MainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return recBox();
                        })),
              )
            ],
          ),
        ));
  }

  Widget catItem(String catName, int index) {
    bool selected = catIndex == index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            catIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 1),
          decoration: BoxDecoration(
            color: selected ? MainColor : Colors.grey[200],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child: Text(catName,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: selected ? Colors.white : Colors.grey,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget recBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(47, 238, 238, 238),
              borderRadius: BorderRadius.circular(25)),
          width: double.infinity,
          height: 125,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "https://images.unsplash.com/photo-1564507592333-c60657eea523?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
                  width: 125,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(
                          "assets/location.png",
                        ),
                        color: MainfontColor,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "PERU",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: MainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Machu Pichchu",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: SecondfontColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "4.5",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: SecondfontColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
