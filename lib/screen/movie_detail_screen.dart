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
      Map list = result['tvShow'];

      _id = list['id'];
      _title = list['name'];
      _imageUrl = list['image_thumbnail_path'];
      _rating = list['rating'];
      _genres = list['genres'];
      _start = list['start_date'];
      _description = list['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _movieId = ModalRoute.of(context)!.settings.arguments as MovieItem;

    return FutureBuilder(
        future: fetchDetails(_movieId.id),
        builder: (context, data) {
          while (_id == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(_title),
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          width: 200,
                          child: Image.network(_imageUrl, fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                            return Container(
                                color: Colors.white,
                                child: LayoutBuilder(
                                  builder: (context, constraint) {
                                    return Icon(Icons.error_outline_sharp,
                                        color: Colors.red,
                                        size: constraint.biggest.width);
                                  },
                                ));
                          })),
                      SizedBox(width: 50),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          CircleAvatar(
                              backgroundColor: Color(0xFFFFC400),
                              child: Text(
                                  double.parse(_rating.toString())
                                      .toStringAsFixed(1),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(height: 20),
                          Text("Genres",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              )),
                          SizedBox(height: 20),
                          for (var i in _genres)
                            Column(
                              children: [Text(i), SizedBox(height: 10)],
                            ),
                          SizedBox(height: 20),
                          Text("Release Date: ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              )),
                          SizedBox(height: 10),
                          Text(_start),
                          SizedBox(height: 10),
                        ],
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Text(_description,
                          style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                              wordSpacing: 1.5,
                              fontStyle: FontStyle.italic)))
                ],
              )));
        });
  }
}
