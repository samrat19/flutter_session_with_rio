import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_with_rio/description_screen.dart';
import 'package:http/http.dart' as http;

main() => runApp(
      MaterialApp(
        home: NewsScreen(),
      ),
    );

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final techNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=3fc464c420834d6fb76899f176e1ae6d';

  List techNews;

  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    this.getTechNews();
  }

  Future<String> getTechNews() async {
    var response = await http.get(Uri.encodeFull(techNewsUrl),
        headers: {"Accept": "Application/json"});

    print(response.body);

    setState(() {
      var convertJsonToData = json.decode(response.body);
      techNews = convertJsonToData['articles'];
      isDataLoaded = true;
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Techy'),
        backgroundColor: Colors.redAccent,
      ),
      body: isDataLoaded == true
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: techNews.length == null ? 0 : techNews.length,
              itemBuilder: (_, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DescriptionScreen(
                            newsPoster: techNews[index]["urlToImage"],
                            newsTitle: techNews[index]["title"],
                            newsContent: techNews[index]["content"],
                            newsPublish: techNews[index]["publishedAt"],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(techNews[index]["urlToImage"]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          techNews[index]["title"],
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
    );
  }
}
