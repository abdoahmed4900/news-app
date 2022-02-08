import 'package:http/http.dart';
import 'dart:convert';

class News {
  late int length;
  late String author;
  late String title;
  late String url;
  late String content;
  late String imageUrl;
  late Map data;
  News() {
    author = ' ';
    title = ' ';
    url = ' ';
    content = ' ';
    length = 0;
  }
  Future<Map> getContent() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b7e4813d0c824e989766cb1ea13734f2'));
    data = jsonDecode(response.body);
    length = data.length;
    return data;
  }

  void assignContent(int index) {
    author = data['articles'][index]['author'];
    title = data['articles'][index]['title'];
    url = data['articles'][index]['url'];
    content = data['articles'][index]['content'];
    imageUrl = data['articles'][index]['urlToImage'];
  }
}
