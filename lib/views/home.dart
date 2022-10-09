import 'package:flutter/material.dart';
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
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 2.0, left: 8.0, right: 8.0),
              child: RichText(
                text: const TextSpan(
                  text: 'Discover ',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 26),
                  children: [
                    TextSpan(
                        text: 'Chicago',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MainColor,
                            fontFamily: 'OpenSans',
                            fontSize: 26)),
                  ],
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 2.0, bottom: 8.0, left: 8.0, right: 8.0),
              child: Text("Explore the best places in the world",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontFamily: 'OpenSans',
                      fontSize: 14)),
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
                        return Center(child: Text('Error: ${snapshot.error}'));
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
                  children: const [
                    Text(
                      "Recommended Atraction",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: SecondfontColor),
                    ),
                    Text("See All",
                        style: TextStyle(
                            color: MainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
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
                  style: TextStyle(
                      color: selected ? Colors.white : Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400))),
        ),
      ),
    );
  }

  Widget recBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(47, 238, 238, 238),
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
                    children: const [
                      Icon(Icons.location_on, color: MainColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "PERU",
                        style: TextStyle(color: MainColor),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Machu Pichchu",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: SecondfontColor),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Text("4.5")
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
