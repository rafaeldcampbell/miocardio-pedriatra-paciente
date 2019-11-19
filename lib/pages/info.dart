import 'package:flutter/material.dart';
import 'package:miocardio_paciente/localization.dart' show Localization;

class Info extends StatefulWidget {
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
      body: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.all(5),
          itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  localization.trans('pagetitleInfo'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
    );
  }
}