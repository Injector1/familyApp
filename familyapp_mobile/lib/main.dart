import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:familyappmobile/components/createTask.dart';
import 'package:familyappmobile/components/listviewElement.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeStatefulWidget(),
      theme: ThemeData(fontFamily: 'Roboto'),
    );
  }
}


class HomeStatefulWidget extends StatefulWidget {
  HomeStatefulWidget({Key key}) : super(key: key);

  @override 
  _HomeStatefulWidgetState createState() => _HomeStatefulWidgetState(); 
}


class _HomeStatefulWidgetState extends State<HomeStatefulWidget> {
  //variables
  String name = "Демьян";

  //default strings
  List<String> strings = [
    "Проверь, есть ли новые задачи для тебя!",
    "Задачи"
  ];

  //default colors
  Map<String, Color> colors = {
    'blue': Colors.blue[900],
    'white': Colors.white
  };

  //building an app
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Привет, $name!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors['white'],
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  SizedBox(height: 30.0),
                  Text(
                    strings[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: colors['white'],
                      fontFamily: 'Roboto',
                    ),
                  )
                ],
              )
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: colors['white'],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    strings[1],
                      style: TextStyle(
                      fontSize: 36.0,
                      color: colors['blue'],
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
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
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            return Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => TaskCreateForm())
            );
          },
          child: Icon(Icons.add),
          backgroundColor: colors['blue'],
        ),
      )
    );
  }
}