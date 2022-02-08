import 'package:flutter/material.dart';
import 'package:news_app/screens/Loading.dart';
import 'package:news_app/screens/article.dart';
import 'package:news_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/article': (context) => Article(),
      },
    );
  }
}
