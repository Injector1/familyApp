import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
  String task_title, task_description;
  DateTime _task_deadline = new DateTime.now();
  int task_author, task_destination;
  FamilyList _familyMember;

  //sending data to sever
  void createTask(task_title, task_description, task_deadline, task_author, task_destination) async {
    final jsonRequest = {
      'task_title': task_title,
      'task_description': task_description,
      'task_deadline': task_deadline,
      'task_author': task_author,
      'task_destination': task_destination
    };
  }

  //picking date
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context, 
      initialDate: _task_deadline, 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2030)
    );

    if (picked != null && picked != _task_deadline) {
      setState(() {
        _task_deadline = picked;
      });
    }
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
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: strings[0],
                    icon: Icon(Icons.title)
                  ),
                  validator: (value) {
                    value.isEmpty ? "Введите название задачи" : task_title = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  minLines: 1, 
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: strings[1],
                    icon: Icon(Icons.text_fields)
                  ),                  
                  validator: (value){
                    value.isEmpty ? "Введите описание задачи" : task_description = value;
                  }
                ),
                SizedBox(height: 40.0),
                RaisedButton(
                  color: Colors.blue[600],
                  child: Text(strings[2], style: TextStyle(fontFamily: 'Roboto', color: Colors.white)),
                  onPressed: (){_selectDate(context);},
                ),
                SizedBox(height: 20.0),
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
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.blue[900],
                  child: Text("Отправить", style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      Color _color = Colors.red;
                      String _alert;
                      
                      if (_familyMember == null) _alert = "Выберите получателя задачи";
                      else {_alert = "Задача успешно отправлена"; _color = Colors.green;}
                      }
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text(_alert), backgroundColor: _color));

                      switch(_familyMember) {
                        case FamilyList.maksim: return task_destination = 0;
                        case FamilyList.julia: return task_destination = 1;
                        case FamilyList.demyan: return task_destination = 2;
                        case FamilyList.platon: return task_destination = 3;
                        case FamilyList.saveliy: return task_destination = 4;
                      }

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

