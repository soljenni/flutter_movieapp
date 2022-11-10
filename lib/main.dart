import 'package:flutter/material.dart';
import 'package:newsapp/screen/main_screen.dart';
import 'package:newsapp/screen/movie_detail_screen.dart';
import 'package:newsapp/screen/movie_search_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieAPP_NAV',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(),
      routes: {
        MovieDetail.routeName: (ctx) => MovieDetail(),
        SearchVideos.routeName: (ctx) => SearchVideos(),
      },
    );
  }
}
