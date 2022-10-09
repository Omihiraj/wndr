import 'package:flutter/material.dart';

import 'views/explore.dart';
import 'views/favourite.dart';
import 'views/home.dart';
import 'views/pages/findbook.dart';
import 'views/profile.dart';
import 'widgets/custom_nav_bar.dart';
import 'constants/config.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = [
    const HomePage(),
    const Explore(),
    const Favourite(),
    const ProfilePage()
  ];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[index],
      bottomNavigationBar: CustomNavBar(
        index: index,
        onChangedTab: onChangedTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FindBook()));
        },
        backgroundColor: MainColor,
        splashColor: MainfontColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
