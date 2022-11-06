import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
export 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}



// Your API key is: 0c80848bcbc54f0c8fd65c703a75cd51

