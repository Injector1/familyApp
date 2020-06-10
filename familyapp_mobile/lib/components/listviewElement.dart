import 'package:flutter/material.dart';
import 'package:familyappmobile/components/taskDetails.dart';

class TaskCard extends StatelessWidget {
  final String task_title, task_description;
  final DateTime task_deadline;
  final int task_author;

  TaskCard({this.task_title, this.task_description, this.task_deadline, this.task_author});

  @override 
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TaskDetails())
        );
      },
      child: Container(
        width: 200.0,
        child: Container(
          child: ListTile(
            title: Container(
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
              height: 500.0,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff5F7FF3),
                    Color(0xFF1F3996)
                  ]
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    task_title,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    task_author.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17
                    ),
                  ),
                  Text(
                    task_deadline.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}