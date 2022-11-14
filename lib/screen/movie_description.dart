import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch;

  const MovieDescription(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(children: [
      Container(
          height: 250,
          child: Stack(children: [
            Positioned(
                child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network((bannerurl), fit: BoxFit.cover))),
            Positioned(
                bottom: 10,
                child: Text(
                  '  Rating \u{2B50}' + vote,
                  style: TextStyle(
                      fontFamily: 'Fontilo',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ])),
      SizedBox(
        height: 15,
      ),
      Container(
          padding: EdgeInsets.all(10),
          child: Text(name != null ? name : 'Not Loaded',
              style: TextStyle(fontSize: 24, fontFamily: 'Fontilo'))),
      Container(
          padding: EdgeInsets.only(left: 10),
          child: Text('Releasing On - ' + launch,
              style: TextStyle(fontFamily: 'Fontilo', fontSize: 14))),
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 200,
            width: 100,
            child: Image.network(posterurl),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(description,
                  style: TextStyle(fontFamily: 'Fontilo', fontSize: 18)),
            ),
          )
        ],
      )
    ])));
  }
}
