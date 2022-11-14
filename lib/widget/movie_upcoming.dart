import 'package:flutter/material.dart';
import 'package:newsapp/screen/movie_description.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key, required this.upcoming});

  final List upcoming;

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
                "Upcoming",
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
                                          name: upcoming[index]['title'],
                                          bannerurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  upcoming[index]
                                                      ['backdrop_path'],
                                          posterurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  upcoming[index]
                                                      ['poster_path'],
                                          description: upcoming[index]
                                              ['overview'],
                                          vote: upcoming[index]['vote_average']
                                              .toString(),
                                          launch: upcoming[index]
                                              ['release_date'],
                                        )));
                          },
                          child: upcoming[index]['title'] != null
                              ? Container(
                                  width: 130,
                                  child: Column(children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      upcoming[index]
                                                          ['poster_path']))),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        child: Text(
                                      upcoming[index]['title'] != null
                                          ? upcoming[index]['title']
                                          : "Title NOT available",
                                      style: TextStyle(fontFamily: 'Fontilo'),
                                      textAlign: TextAlign.center,
                                    ))
                                  ]))
                              : Container());
                    }),
                    itemCount: upcoming.length))
          ],
        ));
  }
}
