import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Movie> movies = [];

  Future<List<Movie>> fetchMovies() async {
    final response = await http
        .get(Uri.parse("https://www.episodate.com/api/most-popular?page=1"));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      Iterable list = result['tv_shows'];
      return list.map((e) => Movie.fromJson(e).toList());
    } else {
      throw Exception("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: Center(child: Text("main screen body")));
  }
}
