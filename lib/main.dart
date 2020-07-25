import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/model/news_model.dart';
import 'logic/news_bloc.dart';

main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => FutureProvider(
    create: (BuildContext context) => NewsBloc().loadNewsData(),
    child: BusinessNewsScreen(),
  );
}

class BusinessNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var news = Provider.of<List<NewsModel>>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (_,int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(news[index].urlToImage),
        ),
      ),
    );
  }
}