import 'package:flutter/material.dart';
import 'package:newsapp/screen/movie_description.dart';

class TopRatingMovies extends StatelessWidget {
  const TopRatingMovies({super.key, required this.toprating});

  final List toprating;

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
                "Top Rated",
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
                                          name: toprating[index]['title'],
                                          bannerurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  toprating[index]
                                                      ['backdrop_path'],
                                          posterurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  toprating[index]
                                                      ['poster_path'],
                                          description: toprating[index]
                                              ['overview'],
                                          vote: toprating[index]['vote_average']
                                              .toString(),
                                          launch: toprating[index]
                                              ['release_date'],
                                        )));
                          },
                          child: toprating[index]['title'] != null
                              ? Container(
                                  width: 130,
                                  child: Column(children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      toprating[index]
                                                          ['poster_path']))),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        child: Text(
                                      toprating[index]['title'] != null
                                          ? toprating[index]['title']
                                          : "Title NOT available",
                                      style: TextStyle(fontFamily: 'Fontilo'),
                                      textAlign: TextAlign.center,
                                    ))
                                  ]))
                              : Container());
                    }),
                    itemCount: toprating.length))
          ],
        ));
  }
}
