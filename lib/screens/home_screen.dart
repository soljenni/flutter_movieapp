import 'package:flutter/material.dart';
export 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
              label: 'home'),
          BottomNavigationBarItem(
              icon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              label: 'Search'),
          BottomNavigationBarItem(
              icon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
              label: 'Profile')
        ],
      ),
    );
  }
}
