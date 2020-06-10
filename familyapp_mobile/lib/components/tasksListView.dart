import 'package:flutter/material.dart';
import 'package:familyappmobile/components/listviewElement.dart';

class TasksHorizontalListView extends StatefulWidget {
  @override
  _TasksHorizontalListViewState createState() => _TasksHorizontalListViewState();
}

class _TasksHorizontalListViewState extends State<TasksHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TaskCard(task_author: 1, task_description: "Abc", task_deadline: DateTime.now(), task_title: "Abc",),
          TaskCard(task_author: 1, task_description: "Abc", task_deadline: DateTime.now(), task_title: "Abc",),
          TaskCard(task_author: 1, task_description: "Abc", task_deadline: DateTime.now(), task_title: "Abc",),
          TaskCard(task_author: 1, task_description: "Abc", task_deadline: DateTime.now(), task_title: "Abc",)

        ],
      )
    );
  }
}