import 'package:flutter/material.dart';
import 'package:newsapp/services/api_service.dart';

import '../models/article_model.dart';
import '../widgets/bottom_navbar.dart';
export 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ApiService client = ApiService();
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      // calling the api service with futurebuilder wiget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return const Center(
              child: Text("success!"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}



// Your API key is: 0c80848bcbc54f0c8fd65c703a75cd51

