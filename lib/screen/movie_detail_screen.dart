import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widget/movie_item.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail({super.key});
  static const routeName = "movie_detail_screen";

  var _id;
  var _title;
  var _description;
  var _start;
  var _imageUrl;
  var _rating;
  var _genres;

  Future fetchDetails(int id) async {
    final response = await http
        .get(Uri.parse("https://www.episodate.com/api/show-details?q=$id"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final list = result['tvShow'];
      print(list);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _movieId = ModalRoute.of(context)!.settings.arguments as MovieItem;

    return FutureBuilder(
        future: fetchDetails(_movieId.id),
        builder: (context, data) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Detail"),
            ),
          );
        });
  }
}
