import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  String name = "Демьян";
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                SizedBox(height: 30.0),
                Text(
                  "Проверь, есть ли новые задачи для тебя!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
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
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  "Задачи",
                    style: TextStyle(
                    fontSize: 36.0,
                    color: Colors.blue[900],
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 40.0),
                        width: 150.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40.0),
                        width: 150.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40.0),
                        width: 150.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}