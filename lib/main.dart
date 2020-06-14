import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void nextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => DetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GestureDetector(
            onTap: nextPage,
            child: Container(
              height: 100.0,
              width: 100.0,
              child: Hero(
                tag: 'android11',
                child: Image.asset(
                  'asset/android_logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 300.0,
            width: 300.0,
            child: Hero(
              tag: 'android11',
              child: Image.asset(
                'asset/android_logo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
