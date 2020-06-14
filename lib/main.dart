import 'package:flutter/cupertino.dart';
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
          child: Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.dstATop,
                ),
                image: AssetImage('asset/android_logo.jpg')
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text('Today we learned about asset',style: TextStyle(
                  color: Colors.amber,
                  fontSize: 55.0,
                ),),
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
