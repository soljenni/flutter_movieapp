import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});
  static const routeName = "movie_detail_screen";

  var _id;
  var _title;
  var _description;
  var _start;
  var _status;
  var _imageUrl;
  var _rating;
  var _genres;

  Future fetchDetails(String id) async {
    final response = await http
        .get(Uri.parse("https://www.episodate.com/api/show-details?q=$id"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final list = result["tvshow"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Center(
        child: Text("detailo"),
      ),
    );
  }
}
