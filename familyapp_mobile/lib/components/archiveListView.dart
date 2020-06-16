import 'dart:convert';
import 'package:familyappmobile/components/taskDetails.dart';
import 'package:flutter/material.dart';
import 'package:familyappmobile/components/listviewElement.dart';
import 'package:http/http.dart' as http;
import 'package:familyappmobile/models/task.dart';


class TasksArchiveHorizontalListView extends StatefulWidget {
  @override
  _TasksArchiveHorizontalListViewState createState() => _TasksArchiveHorizontalListViewState();
}

class _TasksArchiveHorizontalListViewState extends State<TasksArchiveHorizontalListView> {
  List<String> family = [
    "Максим",
    "Юлия",
    "Демьян",
    "Платон",
    "Савелий"
  ];

  Future<List<Task>> _getTasksArchive(userId) async {
    var data = await http.get("http://injectordk.pythonanywhere.com/api/task_archive?user_id=2");
    if (data.statusCode != 200) {
      print("Error");
    } else {
      var jsonData = jsonDecode(utf8.decode(data.bodyBytes));
      List<Task> tasks = [];

      for(var element in jsonData["tasks_archive"]) {
        Task task = Task(
          element["task_title"], 
          element["task_description"], 
          DateTime.now(), 
          element["task_author"], 
          element["task_status"]
        );

        tasks.add(task);

      }
      print(tasks.length);
      print(tasks);
      return tasks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: FutureBuilder(
        future: _getTasksArchive(2),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          
          if(snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue[900],
                ),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TaskDetails(snapshot.data[index]))
                    );
                  },
                  child: TaskCard(
                    task_title: snapshot.data[index].taskTitle,
                    task_description: snapshot.data[index].taskDescription,
                    task_author: snapshot.data[index].taskAuthor,
                    task_deadline: snapshot.data[index].taskDeadline,
                  )
                );
              },
            );
          }
        },
      )
    );
  }
}