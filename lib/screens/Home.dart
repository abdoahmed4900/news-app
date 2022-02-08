import 'package:flutter/material.dart';
import 'package:news_app/news_api/News.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late var data;
  final news = News();
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Container(
          padding: const EdgeInsets.only(left: 132),
          child: Row(
            children: [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'App',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            data = news.getContent();
          });
        },
        child: ListView.builder(
          itemCount: data['news']['totalResults'],
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                navigateToArticle(index);
              },
              child: Card(
                margin: const EdgeInsets.all(22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                data['news']['articles'][index]['urlToImage'],
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Align(
                                child: SizedBox(
                                  child: Text(
                                    data['news']['articles'][index]['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Container(
                                child: Text(
                                  data['news']['articles'][index]['content'],
                                  style: TextStyle(fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

// a method to enter an article
  void navigateToArticle(int index) {
    Navigator.pushNamed(context, '/article', arguments: {
      'content': data['news']['articles'][index]['content'],
      'title': data['news']['articles'][index]['title'],
      'image': data['news']['articles'][index]['urlToImage'],
      'url': data['news']['articles'][index]['url'],
    });
  }
}
