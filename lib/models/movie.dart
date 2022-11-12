class Movie {
  int id;
  String image;
  String title;

  Movie({
    required this.id,
    required this.image,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      image: json['image_thumbnail_path'],
      title: json['name'],

      // deserialize the json (string -> data)
      // : convert json string to movie.json
    );
  }
}
