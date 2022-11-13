import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/movie_menu_screen.dart';
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

//Future is a compartment that contain the data that is not present at the moment but will be contained in the future

  Future<List<Movie>> fetchMovies(int page) async {
    final response = await http.get(
        Uri.parse("https://www.episodate.com/api/most-popular?page=$page"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      List list = result['tv_shows'];
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

// setState docs
// Calling setState notifies the framework that the internal state of this object has changed in a way that might impact the user interface in this subtree, which causes the framework to schedule a build for this State object.

// So if the state of the widget changes you have to call setState to trigger a rebuild of the view and see immediatly the changes implied by the new state.

    _page += 1;
    print("populating " + page.toString());
  }

  @override
  Widget build(BuildContext context) {
    scrollBehavior:
    MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown
      },
    );
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
      appBar: AppBar(
          centerTitle: true,
          title: Text("Movies"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MenuVideos.routeName);
            },
            icon: Icon(Icons.menu),
          ),
          actions: [
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
