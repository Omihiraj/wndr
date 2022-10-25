import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/explore.dart';
import 'views/favourite.dart';
import 'views/home.dart';
import 'views/pages/findbook.dart';
import 'views/profile.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomePage(),
    const Explore(),
    const Favourite(),
    const ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    //double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FindBook()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(
                            "assets/home.png",
                          ),
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                          size: 30,
                        ),
                        Text(
                          'HOME',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Explore();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(
                            "assets/map.png",
                          ),
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                          size: 30,
                        ),
                        Text(
                          'EXPLORE',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Favourite();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(
                            "assets/passion.png",
                          ),
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                          size: 30,
                        ),
                        Text(
                          'FAVOURITE',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                      //width: 10,
                      ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(
                            "assets/person.png",
                          ),
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                          size: 30,
                        ),
                        Text(
                          'PROFILE',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
