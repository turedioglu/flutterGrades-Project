import 'package:flutter/material.dart';
import 'package:flutter_grades/models/student_model.dart';

import 'failTab.dart';
import 'passTab.dart';

class UngradedTab extends StatefulWidget {
  @override
  _UngradedTabState createState() => _UngradedTabState();
}

List<Student> studentList = new List<Student>();
TextEditingController name = TextEditingController();
TextEditingController grade = TextEditingController();

class _UngradedTabState extends State<UngradedTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: studentList.length == 0
          ? Center(
              child: Text(
                " ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(studentList[index].name),
                    subtitle: Text('Grade: ' + studentList[index].grade),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              failStudent.add(studentList[index]);
                              studentList.remove(studentList[index]);
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              passStudent.add(studentList[index]);
                              studentList.remove(studentList[index]);
                            });
                          },
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
