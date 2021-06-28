import 'package:flutter/material.dart';
import 'package:flutter_grades/models/student_model.dart';

class PassTab extends StatefulWidget {
  @override
  _PassTabState createState() => _PassTabState();
}

List<Student> passStudent = List<Student>();

class _PassTabState extends State<PassTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: passStudent.length == 0
          ? Center(
              child: Text(
                " ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : ListView.builder(
              itemCount: passStudent.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(passStudent[index].name),
                    subtitle: Text('Grade: ' + passStudent[index].grade),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
