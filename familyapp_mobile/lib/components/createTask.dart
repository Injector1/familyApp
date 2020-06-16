import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:familyappmobile/components/listviewElement.dart';


enum FamilyList {maksim, julia, demyan, platon, saveliy}


class TaskCreateForm extends StatefulWidget {
  @override
  TaskCreateFormState createState() {
    return TaskCreateFormState();
  }
}


class TaskCreateFormState extends State<TaskCreateForm> {
  //class variables
  final _formKey = GlobalKey<FormState>();
  final List<String> strings = [
    "Название задачи",
    "Описание задачи",
    "Дата сдачи",
    "Кому"
  ];
  Color _color = Colors.red;
  String _alert;

  //variables
  String _taskTitle, _taskDescription;
  DateTime _taskDeadline = new DateTime.now();
  int _taskAuthor, _taskDestination;
  FamilyList _familyMember;
  Map<FamilyList, int> identify = {
    FamilyList.maksim: 0,
    FamilyList.julia: 1,
    FamilyList.demyan: 2,
    FamilyList.platon: 3,
    FamilyList.saveliy: 4
  };

  //sending data to sever
  void createTask(taskTitle, taskDescription, taskDeadline, taskAuthor, taskDestination) async {
    final jsonRequest = {
      'task': {
        'task_title': taskTitle,
        'task_id': 5,
        'task_description': taskDescription,
        'task_deadline': taskDeadline.toString(),
        'task_author': taskAuthor,
        'task_destination': taskDestination,
        'task_status': 'W'
      }
    };
    String body = jsonEncode(jsonRequest);
    print(body);
    http.Response response = await http.post(
      "http://injectordk.pythonanywhere.com/api/tasks",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    print(response.statusCode);

  }

  //picking date
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context, 
      initialDate: _taskDeadline, 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2030)
    );

    if (picked != null && picked != _taskDeadline) {
      setState(() {
        _taskDeadline = picked;
      });
    }
  }

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: strings[0],
        icon: Icon(Icons.title)
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Введите название задачи";
        }
      },
      onSaved: (value) {
        _taskTitle = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      minLines: 1, 
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: strings[1],
        icon: Icon(Icons.text_fields)
      ),                  
      validator: (value){
        if (value.isEmpty) {
          return "Введите описание задачи";
        }
      },
      onSaved: (value) {
        _taskDescription = value;
      },
    );
  }

  Widget _buildDeadline() {
    return RaisedButton(
      color: Colors.blue[600],
      child: Text(strings[2], style: TextStyle(fontFamily: 'Roboto', color: Colors.white)),
      onPressed: (){_selectDate(context);},
    );
  }

  Widget _buildDestination() {
    return Column(
      children: <Widget>[
        Text(strings[3], style: TextStyle(fontFamily: 'Roboto-Bold', color: Colors.blue[900], fontWeight: FontWeight.bold)),

        RadioListTile(
          title: Text("Максим", style: TextStyle(fontFamily: 'Roboto', color: Colors.blue[900])),
          value: FamilyList.maksim,
          groupValue: _familyMember,
          onChanged: (FamilyList value){setState(() {_familyMember = value;});},
        ),
        RadioListTile(
          title: Text("Юлия", style: TextStyle(fontFamily: 'Roboto', color: Colors.blue[900])),
          value: FamilyList.julia,
          groupValue: _familyMember,
          onChanged: (FamilyList value){setState(() {_familyMember = value;});},
        ),
        RadioListTile(
          title: Text("Демьян", style: TextStyle(fontFamily: 'Roboto', color: Colors.blue[900])),
          value: FamilyList.demyan,
          groupValue: _familyMember,
          onChanged: (FamilyList value){setState(() {_familyMember = value;});},
        ),
        RadioListTile(
          title: Text("Платон", style: TextStyle(fontFamily: 'Roboto', color: Colors.blue[900])),
          value: FamilyList.platon,
          groupValue: _familyMember,
          onChanged: (FamilyList value){setState(() {_familyMember = value;});},
        ),
        RadioListTile(
          title: Text("Савелий", style: TextStyle(fontFamily: 'Roboto', color: Colors.blue[900]),),
          value: FamilyList.saveliy,
          groupValue: _familyMember,
          onChanged: (FamilyList value){setState(() {_familyMember = value;});},
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                Text("Создать задачу", style: TextStyle(color: Colors.blue[900], fontSize: 36.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto-Bold')),
                SizedBox(height: 20.0),
                _buildTitle(),
                SizedBox(height: 20.0),
                _buildDescription(),
                SizedBox(height: 40.0),
                _buildDeadline(),
                SizedBox(height: 20.0),
                _buildDestination(),
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.blue[900],
                  child: Text("Отправить", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {                      
                      if (_familyMember != null) {
                        _alert = "Задача успешно отправлена"; 
                        _color = Colors.green;
                        _taskDestination = identify[_familyMember];
                      } else {
                        _alert = "Выберите получателя задачи";
                        }
                      }
                      showDialog(context: context, builder: (BuildContext){
                        return AlertDialog(
                          backgroundColor: _color,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          title: Text(_alert ?? "Заполните все поля", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        );
                      });

                      _formKey.currentState.save();
                      createTask(_taskTitle, _taskDescription, _taskDeadline, 2, _taskDestination);
                      print(_taskTitle);
                      print(_taskDescription);
                      print(_taskDeadline);
                      print(_taskDestination);
                  },
                )
                                                               
              ]
            ),
          )
        )
      )
    );
  }
}

