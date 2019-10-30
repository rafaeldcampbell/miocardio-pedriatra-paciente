import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();

}
class HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromRGBO(253, 224, 224, 1),
            body: Column(
              children: <Widget>[
                Text('O app ainda está em construção'),
              ],
            )
      );
  }
}
