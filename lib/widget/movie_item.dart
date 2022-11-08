import 'package:flutter/material.dart';
import 'package:newsapp/screen/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;

  MovieItem(
    this.id,
    this.imageUrl,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GridTile(
          footer: GridTileBar(
              backgroundColor: Colors.black,
              title: Text(
                title,
                textAlign: TextAlign.start,
              )),
          child: Image.network(imageUrl, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return Container(
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Icon(Icons.error_outline_sharp,
                        color: Colors.red, size: constraint.biggest.width);
                  },
                ));
          })),
      onTap: () {
        Navigator.pushNamed(context, MovieDetail.routeName);
      },
    );
  }
}
