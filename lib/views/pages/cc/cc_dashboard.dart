import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../constants/config.dart';
import '../../../models/tour.dart';
import '../../../services/fire_service.dart';
import '../addtour.dart';

class ContentCreator extends StatefulWidget {
  const ContentCreator({super.key});

  @override
  State<ContentCreator> createState() => _ContentCreatorState();
}

class _ContentCreatorState extends State<ContentCreator> {
  int catIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTour()));
        },
        backgroundColor: MainColor,
        splashColor: MainfontColor,
        child: const Icon(Icons.add),
      ),
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
                text: 'Hello ',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 26),
                children: [
                  TextSpan(
                      text: 'Creators',
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
            child: Text("Add new places in your country",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: 'OpenSans',
                    fontSize: 14)),
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
                          height: 750,
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0),
                            itemCount: tours.length,
                            itemBuilder: (BuildContext context, int index) {
                              return cctourCard(tours[index]);
                            },
                          ),
                        );
                      }
                    }
                }
              }),
        ],
      ),
    );
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
}
