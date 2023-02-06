import 'package:flutter/material.dart';
import 'package:thidle/main.dart';

class BottomNav extends StatefulWidget {
  final Function(int index) setIndex;
  final int? currentIndex;
  const BottomNav({super.key, required this.currentIndex, required this.setIndex});

  @override
  State<BottomNav> createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bolt_rounded),
          label: 'Swifts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up_rounded),
          label: 'Trending',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_rounded),
          label: 'Notifications',
        ),
      ],
      enableFeedback: false,
      currentIndex: widget.currentIndex ?? 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 25,
      unselectedItemColor: Colors.grey[500],
      selectedItemColor: widget.currentIndex != null ? Thidle.defaultColor : Colors.grey[500],
      onTap: (int index) => widget.setIndex(index),
    );
  }
}