import 'package:flutter/material.dart';
import 'package:newsapp/screen/movie_description.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Now Playing",
                style: TextStyle(fontFamily: 'Fontilo', fontSize: 25),
              ),
            ),
            SizedBox(height: 5),
            Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDescription(
                                          name: trending[index]['title'],
                                          bannerurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['backdrop_path'],
                                          posterurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['poster_path'],
                                          description: trending[index]
                                              ['overview'],
                                          vote: trending[index]['vote_average']
                                              .toString(),
                                          launch: trending[index]
                                              ['release_date'],
                                        )));
                          },
                          child: trending[index]['title'] != null
                              ? Container(
                                  width: 130,
                                  child: Column(children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      trending[index]
                                                          ['poster_path']))),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        child: Text(
                                      trending[index]['title'] != null
                                          ? trending[index]['title']
                                          : "Title NOT available",
                                      style: TextStyle(fontFamily: 'Fontilo'),
                                      textAlign: TextAlign.center,
                                    ))
                                  ]))
                              : Container());
                    }),
                    itemCount: trending.length))
          ],
        ));
  }
}
