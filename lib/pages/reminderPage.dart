import 'package:flutter/material.dart';
import 'package:miocardio_paciente/functions/localization.dart'
    show Localization;
import 'package:table_calendar/table_calendar.dart';

class ReminderPage extends StatefulWidget {
  ReminderPageState createState() => ReminderPageState();
}

class ReminderPageState extends State<ReminderPage> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(253, 224, 224, 1),
        body: bodyData(localization));
  }

  Widget bodyData(localization) => Scaffold(
        backgroundColor: Color.fromRGBO(253, 224, 224, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(253, 224, 224, 1),
          title: title(localization),
        ),
        body: Container(
          child: Column(
            children: <Widget>[calendar()],
          ),
        ),
      );

  Widget title(localization) => Center(
        child: Text(localization.trans('pagetitleReminder'),
            key: Key("pagetitleReminder"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      );

 //Retorna o calendario da pagina
  Widget calendar() => TableCalendar(
        calendarStyle: CalendarStyle(
          todayColor: Colors.purpleAccent,
        ),
        calendarController: _controller,
      );
}
