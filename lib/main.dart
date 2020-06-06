import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_with_rio/home_screen.dart';

main() => runApp(
      MaterialApp(
        home: RegistrationScreen(),
      ),
    );

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String firstName = '';
  String secondName = '';
  String emailId = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Registration Here....'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            /*First Name*/
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Your First Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (val) =>
                  val.isEmpty ? 'Please Provide your First Name' : null,
              onChanged: (val) {
                setState(
                  () => firstName = val,
                );
              },
            ),
            /*Second Name*/
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Your Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (val) =>
                  val.isEmpty ? 'Please Provide your Title' : null,
              onChanged: (val) {
                setState(
                  () => secondName = val,
                );
              },
            ),
            /*Email ID Name*/
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Your Email ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (val) {
                if(val.isEmpty){
                  return 'Please provide a email id';
                }else if(val.contains('@')){
                  return null;
                }else{
                  return 'please provide a valid email id';
                }
              },
              onChanged: (val) {
                setState(
                  () => emailId = val,
                );
              },
            ),
            /*Submit Button*/
            GestureDetector(
              onTap: () {
                _formKey.currentState.validate()
                    ? Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(
                            firstName: firstName,
                            secondName: secondName,
                            emailId: emailId,
                          ),
                        ),
                      )
                    : print('Check Again');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  color: Colors.green[700],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Submit Details',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
