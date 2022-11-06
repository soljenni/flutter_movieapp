import 'package:flutter/material.dart';
import 'package:newsapp/screens/discover_screen.dart';
import 'package:newsapp/screens/home_screen.dart';

import '../screens/article_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(Icons.home)),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, DiscoverScreen.routeName);
                },
                icon: const Icon(Icons.search)),
            label: 'Serch'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ArticleScreen.routeName);
                },
                icon: const Icon(Icons.person)),
            label: 'Profile')
      ],
    );
  }
}
