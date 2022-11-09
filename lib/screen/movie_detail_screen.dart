import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future fetchDetails(String id) async {
    final response = await http
        .get(Uri.parse("https://www.episodate.com/api/show-details?q=$id"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final list = result["tvShow"];
      _id = list['id'];
      _title = list['name'];
      _description = list['description'];
      _start = list['start_date'];
      _imageUrl = list['image_thumbnail_path'];
      _genres = list['genres'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _movieId = ModalRoute.of(context)!.settings.arguments.toString();

    return FutureBuilder(
      future: fetchDetails(_movieId),
      builder: (context, data){
        while(_id == null){
          return const Center(child: CircularProgressIndicator(),);
        }
      }

      return Scaffold(

appBar: AppBar( title: Text(_title),),

      )
      
      ),
    ;
  }
}
