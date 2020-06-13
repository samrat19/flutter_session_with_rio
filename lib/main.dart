import 'package:flutter/material.dart';
import 'package:flutter_session_with_rio/details_screen.dart';

main() => runApp(
      MaterialApp(
        home: MyScreen(),
      ),
    );

class MyScreen extends StatelessWidget {
  List allStudents = [
    StudentsModel(
      'John Mac',
      '12334555',
    ),
    StudentsModel(
      'Johnson Mac',
      '123343435',
    ),
    StudentsModel(
      'Chappel Mac',
      '12345552323',
    ),
    StudentsModel(
      'Max Mac',
      '1233232444',
    ),
    StudentsModel(
      'Bill Gates',
      '123343435435',
    ),
    StudentsModel(
      'John Mac',
      '12334555',
    ),
    StudentsModel(
      'Johnson Mac',
      '123343435',
    ),
    StudentsModel(
      'Chappel Mac',
      '12345552323',
    ),
    StudentsModel(
      'Max Mac',
      '1233232444',
    ),
    StudentsModel(
      'Bill Gates',
      '123343435435',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('ListView Tutorial'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: allStudents.length,
          itemBuilder: (_, int index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                          id: allStudents[index].idNumber,
                          name: allStudents[index].name,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 50.0,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      allStudents[index].name,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      allStudents[index].idNumber,
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StudentsModel {
  final String name;
  final String idNumber;

  StudentsModel(
    @required this.name,
    @required this.idNumber,
  );
}
