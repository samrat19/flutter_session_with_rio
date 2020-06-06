import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  final String firstName;
  final String secondName;
  final String emailId;

  const HomeScreen({
    Key key,
    @required this.firstName,
    @required this.secondName,
    @required this.emailId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Text('Your Name ${firstName} ${secondName} and your email id is ${emailId}'),
    );
  }
}
