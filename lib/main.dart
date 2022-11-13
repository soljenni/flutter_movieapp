import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/main_screen.dart';
import 'package:newsapp/screen/movie_detail_screen.dart';
import 'package:newsapp/screen/movie_menu_screen.dart';
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
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'MovieAPP_NAV',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(),
      routes: {
        MenuVideos.routeName: (ctx) => MenuVideos(),
        MovieDetail.routeName: (ctx) => MovieDetail(),
        SearchVideos.routeName: (ctx) => SearchVideos(),
      },
    );
  }
}

// every widgets are the instances that are created throuth classes

//every widegets has its own build method