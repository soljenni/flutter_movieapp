import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/article_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          DiscoverScreen.routeName: (context) => const DiscoverScreen(),
          ArticleScreen.routeName: (context) => const ArticleScreen(),
        });
  }
}
