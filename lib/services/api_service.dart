// making http request services
import '../models/article_model.dart';
import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0c80848bcbc54f0c8fd65c703a75cd51";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("cannot get the article");
    }
  }
}
