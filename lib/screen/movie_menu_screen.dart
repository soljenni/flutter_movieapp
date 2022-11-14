import 'package:flutter/material.dart';
import 'package:newsapp/screen/main_screen.dart';
import 'package:newsapp/screen/movie_search_screen.dart';
import 'package:newsapp/widget/movie_toprated.dart';
import 'package:newsapp/widget/movie_trending.dart';
import 'package:newsapp/widget/movie_upcoming.dart';

import 'package:tmdb_api/tmdb_api.dart';

class MenuVideos extends StatefulWidget {
  const MenuVideos({super.key});
  static const routeName = "movie_menu_screen";
  @override
  State<MenuVideos> createState() => _MenuVideosState();
}

class _MenuVideosState extends State<MenuVideos> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  final String apiKey = "b7bb4151d5657832597892be89325340";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiN2JiNDE1MWQ1NjU3ODMyNTk3ODkyYmU4OTMyNTM0MCIsInN1YiI6IjYzNzEyMWY5Nzk4ZTA2MDA3ZmU2MmE5NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mLc_A774DH8PHn-UTU8utn9TeqiWnIXlc950ABpub3Q";
  List topratingMovies = [];
  List upcomingMovies = [];
  List trendingMovies = [];

  loadMovies() async {
    TMDB tmdbCustom = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map toprating = await tmdbCustom.v3.movies.getTopRated();
    Map trending = await tmdbCustom.v3.trending.getTrending();

    Map upcoming = await tmdbCustom.v3.movies.getUpcoming();

    setState(() {
      topratingMovies = toprating["results"];
      upcomingMovies = upcoming["results"];
      trendingMovies = trending["results"];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Recommendation"),
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: Icon(Icons.home),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchVideos.routeName);
                },
                icon: Icon(Icons.search),
              )
            ]),
        body: ListView(children: [
          UpcomingMovies(upcoming: upcomingMovies),
          TrendingMovies(trending: trendingMovies),
          TopRatingMovies(toprating: topratingMovies)
        ]));
  }
}
