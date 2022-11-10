import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movie.dart';

class SearchVideos extends StatefulWidget {
  const SearchVideos({super.key});
  static const routeName = "movie_search_screen";

  @override
  State<SearchVideos> createState() => SearchVideosState();
}

class SearchVideosState extends State<SearchVideos> {
  List<Movie> movies = [];
  int _page = 1;
  Future<List<Movie>> searchMovies(int page, String query) async {
    final response = await http.get(
        Uri.parse("https://www.episodate.com/api/search?q=$query&page=$page"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      Iterable list = result['tv_shows'];
      return list.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("failed");
    }
  }

  void searchVideos(int page, String query) async {
    final myMovies = await searchMovies(page, query);
    setState(() {
      movies.addAll(myMovies);
    });

    _page += 1;
    print("populating " + page.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
