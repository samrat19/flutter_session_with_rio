import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int count = 0;

  increment() {
    setState(() {
      count++;
      print(count);
    });
  }

  decrement(){
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Flutter Intro'),
      ),
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World $count',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              MaterialButton(
                onPressed: increment,
                color: Colors.white,
                child: Text('Add Num',style: TextStyle(
                  color: Colors.green,
                ),),
              ),
              Spacer(),
              MaterialButton(
                onPressed: decrement,
                color: Colors.white,
                child: Text('Sub Num',style: TextStyle(
                  color: Colors.red,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
