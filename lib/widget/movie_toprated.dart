import 'package:flutter/material.dart';

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
            Text("Top Rated"),
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
                                              'http://image.tmdb.org/t/p/w500' +
                                                  toprating[index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                    child: Text(
                                        toprating[index]['title'] != null
                                            ? toprating[index]['title']
                                            : "Title NOT available"))
                              ])));
                    }),
                    itemCount: toprating.length))
          ],
        ));
  }
}
