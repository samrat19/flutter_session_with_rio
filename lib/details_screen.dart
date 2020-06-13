import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String id;

  const DetailsScreen({
    Key key,
    @required this.name,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Student Details'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: Colors.red,
                size: 100.0,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.indigo,
                ),
              ),
              Text(
                id,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightGreen[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
