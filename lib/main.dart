import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: CalculatorScreen(),
      ),
    );

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = '0';

  TextEditingController numberOne = TextEditingController();
  TextEditingController numberTwo = TextEditingController();

  add(){
    setState(() {
      int add = int.parse(numberOne.text) + int.parse(numberTwo.text);
      result = add.toString();
      print(result);
    });
  }

  sub(){
    setState(() {
      int sub = int.parse(numberOne.text) - int.parse(numberTwo.text);
      result = sub.toString();
      print(result);
    });
  }

  multi(){
    setState(() {
      int multi = int.parse(numberOne.text) * int.parse(numberTwo.text);
      result = multi.toString();
      print(result);
    });
  }

  div(){
    setState(() {
      double div = double.parse(numberOne.text) / double.parse(numberTwo.text);
      result = div.toStringAsFixed(4);
      print(result);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Calculator'),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width/7,
                  right: MediaQuery.of(context).size.width/3,
                ),
                child: TextField(
                  controller: numberOne,
                  decoration: InputDecoration(
                    hintText: 'input the 1st Number',
                    labelText: '1st Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 4.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width/7,
                  right: MediaQuery.of(context).size.width/3,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'input the 2nd Number',
                    labelText: '2nd Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 4.0,
                      ),
                    ),
                  ),
                  controller: numberTwo,
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                result,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: add,
                    color: Colors.grey[700],
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.grey[700],
                    onPressed: sub,
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: multi,
                    color: Colors.grey[700],
                    child: Text(
                      'X',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: div,
                    color: Colors.grey[700],
                    child: Text(
                      '/',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
