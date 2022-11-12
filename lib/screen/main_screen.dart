import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/movie.dart';
import 'package:http/http.dart' as http;
import '../widget/movie_item.dart';
import 'movie_search_screen.dart';

// to maintain the state within the widget tree, 'key' is used

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Movie> movies = [];
  int _page = 1;

  void initState() {
    super.initState();
    populateMovies(_page);

    // loading data when the page initializes
  }

  Future<List<Movie>> fetchMovies(int page) async {
    final response = await http.get(
        Uri.parse("https://www.episodate.com/api/most-popular?page=$page"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      Iterable list = result['tv_shows'];
      return list.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("failed");
    }
  }

  void populateMovies(int page) async {
    final myMovies = await fetchMovies(page);
    setState(() {
      movies.addAll(myMovies);
    });

    _page += 1;
    print("populating " + page.toString());
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          populateMovies(_page);
        });
      }
    });

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Movies"), actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SearchVideos.routeName);
          },
          icon: Icon(Icons.search),
        )
      ]),
      body: movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (ctx, index) => MovieItem(
                  movies[index].id, movies[index].image, movies[index].title),
              itemCount: movies.length,
              padding: EdgeInsets.all(10),
              controller: _controller),
    );
  }
}
