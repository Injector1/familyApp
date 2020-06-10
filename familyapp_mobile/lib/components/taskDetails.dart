import 'package:flutter/material.dart';


class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  int task_id, task_author = 1;
  String task_title = "Помыть пол", 
  task_description = "dsfjkllllllllllllllllllllllllksfjksdjfldsflsdjfsdlkfjdsflksdfjksdjflsdjfsjkfsdkflj";
  DateTime task_deadline = DateTime.now();
  List<String> family = [
    "Максим",
    "Юлия",
    "Демьян",
    "Платон",
    "Савелий"
  ];
  String decline_reason;

  void getTaskInfo(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Задача"),),
      backgroundColor: Colors.blue[900],
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0,),
          Text(
            "$task_title",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36.0,
              fontWeight: FontWeight.bold
              ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Описание задачи:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[900],
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "$task_description",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[900],
                      fontFamily: 'Roboto',
                    ),                    
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "Автор задачи:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[900],
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "${family[task_author]}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[900],
                      fontFamily: 'Roboto',
                    ), 
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "Дедлайн:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[900],
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ), 
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "${task_deadline.toString()}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue[900],
                      fontFamily: 'Roboto',
                    ), 
                  ),
                  Text(decline_reason??"abc"),
                  SizedBox(height: 30.0),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        onPressed: (){
                          showDialog(context: context,builder: (BuildContext context){
                            TextEditingController customController = TextEditingController();
                            return AlertDialog(
                              title: Text("Причина отказа"),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              content: TextField(controller: customController,),
                              actions: <Widget>[
                                MaterialButton(
                                  child: Text("Подтвердить", style: TextStyle(color: Colors.blue[900]),),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.blue[900])),
                                  onPressed: (){
                                    decline_reason = customController.text.toString();
                                    Navigator.of(context).pop(customController.text.toString());
                                  },
                                ),
                                MaterialButton(
                                  child: Text("Отменить", style: TextStyle(color: Colors.red),),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.red)),
                                  
                                  onPressed: (){
                                    Navigator.of(context).pop(customController.text.toString());
                                  },
                                )
                              ],
                            );
                          },);
                        },
                        textColor: Colors.red,
                        child: Text("Отклонить задачу"),
                      ),
                      RaisedButton(
                        onPressed: (){
                          showDialog(context: context, builder: (BuildContext){
                            return AlertDialog(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              title: Text("Задача успешно сдана!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            );
                          });
                        },
                        color: Colors.blue[900],
                        child: Text("Сдать задачу"),
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ]
      ),
    );
  }
}