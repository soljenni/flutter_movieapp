import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
export 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}


  }
}
