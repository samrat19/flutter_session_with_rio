import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  final String newsPoster;
  final String newsTitle;
  final String newsContent;
  final String newsPublish;

  const DescriptionScreen({
    Key key,
    @required this.newsPoster,
    @required this.newsTitle,
    @required this.newsContent,
    @required this.newsPublish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Image.network(newsPoster),
            Text(
              newsTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
              ),
            ),
            Text(
              newsPublish,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              newsContent,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
