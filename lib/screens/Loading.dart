import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/news_api/News.dart';
import 'package:news_app/screens/Home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<Map> getData() async {
    News news = News();
    await news.getContent();
    Map map = news.data;
    return map;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.hasData) {
              Map? map = snapshot.data;
              navigateToHome(context, map!);
            }
            return LoadingWidget();
          },
        ));
  }

  Future navigateToHome(BuildContext context, Map map) async {
    await Future.delayed(Duration(milliseconds: 500));
    return Navigator.pushReplacementNamed(context, '/home', arguments: {
      'news': map,
    });
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading...',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 30),
          SpinKitPouringHourglass(
            color: Colors.blue,
            size: 80,
          ),
        ],
      ),
    );
  }
}
