import 'package:flutter/material.dart';
import 'package:miocardio_paciente/functions/localization.dart'
    show Localization;
import 'package:table_calendar/table_calendar.dart';

class ReminderPage extends StatefulWidget {
  ReminderPageState createState() => new ReminderPageState();
}

class ReminderPageState extends State<ReminderPage> {
  CalendarController _controller;
  Map<DateTime, List> _events;

  bool isEmpty(String s) => s == null || s.isEmpty;
  
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
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[calendar(localization)],
        )
        
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
  Widget calendar(localization){
    //captura a localização do dispositivo
    bool isEmpty(String s) => s == null || s.isEmpty;
    String locale = Localizations.localeOf(context).languageCode.toString();
    locale += isEmpty(Localizations.localeOf(context).countryCode) ? "" : "_" + Localizations.localeOf(context).countryCode.toString().toUpperCase();
    
    //carregando eventos antes de criar o calendário
    updateEvents();

    return TableCalendar(
        key: Key("calendarKey"),
        locale: locale,
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonVisible: false,
        ),
        calendarStyle: CalendarStyle(
          todayColor: Color.fromRGBO(249, 124, 124, 0.6),
          markersColor: Color.fromRGBO(50, 50, 50, 0.5),
          markersMaxAmount: 3,
        ),
        onDaySelected: (date, events) {
          print(locale);
          updateCards(date);
          setState(() {});
        },
        builders: CalendarBuilders(
            selectedDayBuilder: (context, date, events) => dayStyle(date, 1),
            todayDayBuilder: (context, date, events) => dayStyle(date, 0.5)
        ),
        calendarController: _controller,
        events: _events,
      );
  }

  //Estilo dos dias
  Widget dayStyle(date, double transparency) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(249, 124, 124, transparency),
            borderRadius: BorderRadius.circular(4.0)),
        child: Text(date.day.toString(), style: TextStyle(color: Colors.white)),
      );

  void updateCards(date){
    //atualiza os lembretes
  }

  void updateEvents(){
    _events = {};
    //carrega a lista de eventos
  }
}
