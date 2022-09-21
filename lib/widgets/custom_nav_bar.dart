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
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        tabItem(index: 0, icon: const Icon(Icons.home)),
        tabItem(index: 1, icon: const Icon(Icons.map_sharp)),
        placeholder,
        tabItem(index: 2, icon: const Icon(Icons.favorite)),
        tabItem(index: 3, icon: const Icon(Icons.person))
      ]),
    );
  }

  Widget tabItem({required int index, required Icon icon}) {
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
