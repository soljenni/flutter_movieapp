import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'movie_item.dart';

class SearchVideo extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text("Search Videos"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Movie> movies = [];
    int _page = 1;

    Future<List<Movie>> searchMovies(int page, String query) async {
      final response = await http.get(Uri.parse(
          "https://www.episodate.com/api/search?q=$query&page=$page"));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        Iterable list = result['tv_shows'];
        return list.map((e) => Movie.fromJson(e)).toList();
      } else {
        throw Exception("failed");
      }
    }

    void populateMovies(int _page, String query) async {
      final myMovies = await searchMovies(_page, query);

      movies.addAll(myMovies);

      _page += 1;
      print("populating " + _page.toString());
    }

    final ScrollController _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        populateMovies(_page, query);
      }
    });

    return FutureBuilder(
        future: searchMovies(_page, query),
        builder: (context, data) {
          return Scaffold(
            body: movies.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (ctx, index) => MovieItem(movies[index].id,
                        movies[index].image, movies[index].title),
                    itemCount: movies.length,
                    padding: EdgeInsets.all(10),
                    controller: _controller),
          );
        });
  }
}
