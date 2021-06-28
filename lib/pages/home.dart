import 'package:flutter/material.dart';
import 'package:flutter_grades/models/student_model.dart';

import 'failTab.dart';
import 'passTab.dart';
import 'ungradedTab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    addStudent(String name, String grade) {
      setState(() {
        studentList.add(
          Student(name: name, grade: grade),
        );
      });
    }

    Future<String> createAlertDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('New Student'),
              content: Container(
                width: 200,
                height: 100,
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(hintText: 'Student Name'),
                        controller: name),
                    TextField(
                        decoration: InputDecoration(hintText: 'Student Grade'),
                        controller: grade),
                  ],
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  textColor: Colors.blue,
                  elevation: 5.0,
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  textColor: Colors.blue,
                  elevation: 5.0,
                  child: Text('Add'),
                  onPressed: () {
                    setState(() {
                      if (name.text != "" && grade.text != "") {
                        setState(() {
                          addStudent(
                              name.text.toString(), grade.text.toString());
                          Navigator.pop(context);
                        });
                      }
                    });
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Students'),
            backgroundColor: Colors.blue,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: 'Ungraded',
                ),
                Tab(
                  text: 'Pass',
                ),
                Tab(
                  text: 'Fail',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              UngradedTab(),
              PassTab(),
              FailTab(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              createAlertDialog(context);
            },
          ),
        ),
      ),
    );
  }
}
