import 'package:flutter/material.dart';
import 'package:flutter_grades/models/student_model.dart';

class FailTab extends StatefulWidget {
  @override
  _FailTabState createState() => _FailTabState();
}

List<Student> failStudent = List<Student>();

class _FailTabState extends State<FailTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: failStudent.length == 0
          ? Center(
              child: Text(
                " ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : ListView.builder(
              itemCount: failStudent.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(failStudent[index].name),
                    subtitle: Text('Grade: ' + failStudent[index].grade),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
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
