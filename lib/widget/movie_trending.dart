import 'package:flutter/material.dart';

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
                          onTap: () {},
                          child: Container(
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
                              ])));
                    }),
                    itemCount: trending.length))
          ],
        ));
  }
}
