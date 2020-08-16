import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Stream Builder'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  final MyCounter _myCounter = MyCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _myCounter.getCounter(),
          builder: (context, snapshot) => Text(
              snapshot.data == null ? '0':snapshot.data.toString(),
              style: TextStyle(
                fontSize: 70.0,
              ),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_myCounter.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyCounter{
  int _counter = 0;
  StreamController _streamController = StreamController<int>();

  Stream<int> getCounter() => _streamController.stream;

  void increment(){
    _counter++;
    _streamController.add(_counter);
  }

  dispose() => _streamController.close();
}