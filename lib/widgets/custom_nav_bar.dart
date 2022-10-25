import 'package:flutter/material.dart';

import '../constants/config.dart';

class CustomNavBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const CustomNavBar({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
        opacity: 0,
        child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)));
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(85, 158, 158, 158),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          elevation: 20.0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            tabItem(
              index: 0,
              icon: const Icon(Icons.home_outlined),
              text: ('home'),
            ),
            tabItem(
              index: 1,
              icon: const Icon(Icons.map_sharp),
              text: ('Explore'),
            ),
            placeholder,
            tabItem(
              index: 2,
              icon: const Icon(Icons.favorite_outline),
              text: ('Favourites'),
            ),
            tabItem(
              index: 3,
              icon: const Icon(Icons.person_outline),
              text: ('Profile'),
            ),
          ]),
        ),
      ),
    );
  }

  Widget tabItem(
      {required int index, required Icon icon, required String text}) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(
        color: isSelected ? MainColor : Colors.grey,
      ),
      child: IconButton(
        iconSize: 38,
        icon: icon,
        onPressed: () => widget.onChangedTab(index),  
      ),
    );
  }
}
