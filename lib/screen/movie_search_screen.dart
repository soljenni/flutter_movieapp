import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movie.dart';
import '../widget/movie_item.dart';

class SearchVideos extends StatefulWidget {
  const SearchVideos({super.key});
  static const routeName = "movie_search_screen";

  @override
  State<SearchVideos> createState() => SearchVideosState();
}

class SearchVideosState extends State<SearchVideos> {
  List<Movie> movies = [];
  int _page = 1;
  String _query = "";
  late int pages;

  // void initState() {
  //   super.initState();
  //   searchVideos(_page, query);
  // }

  Future<List<Movie>> searchMovies(int page, String query) async {
    final response = await http.get(
        Uri.parse("https://www.episodate.com/api/search?q=$query&page=$page"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      List list = result['tv_shows'];
      if (mounted) {
        setState(() {
          pages = result["pages"];
        });
      }
      return list.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("failed");
    }
  }

  void searchVideos(int page, String query) async {
    final myMovies = await searchMovies(page, query);
    setState(() {
      movies.addAll(myMovies);
      _query = query;
    });
    print("populating " + _page.toString() + query);
    _page += 1;
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange &&
          pages >= _page) {
        setState(() {
          searchVideos(_page, _query);
        });
      } else if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange &&
          _page > pages) {}
    });

    return FutureBuilder(
        future: searchMovies(_page, _query),
        builder: (context, data) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Search"),
              ),
              body: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                        onChanged: ((value) {
                          movies = [];
                          _page = 1;
                        }),
                        onSubmitted: (value) => searchVideos(_page, value),
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 228, 228),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.search))),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: movies.isEmpty
                          ? Center(child: Text("search for the movie"))
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 30,
                              ),
                              itemBuilder: (ctx, index) => MovieItem(
                                  movies[index].id,
                                  movies[index].image,
                                  movies[index].title),
                              itemCount: movies.length,
                              padding: EdgeInsets.all(10),
                              controller: _controller)),
                ],
              ));
        });
  }
}
