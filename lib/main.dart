import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Image'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400.0,
            width: 400.0,
            child: Image.asset(
              'asset/android_logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
