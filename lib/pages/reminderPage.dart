import 'package:flutter/material.dart';
import 'package:miocardio_paciente/database/reminder.dart';
import 'package:miocardio_paciente/functions/localization.dart'
    show Localization;
import 'package:table_calendar/table_calendar.dart';
import 'package:miocardio_paciente/components/cardReminder.dart';

class ReminderPage extends StatefulWidget {
  ReminderPage({this.isTest = false});
  bool isTest;
  ReminderPageState createState() => new ReminderPageState(isTest : isTest == null ? false : isTest);
}

class ReminderPageState extends State<ReminderPage> {
  ReminderPageState({this.isTest = false});
  CalendarController _controller;
  Map<DateTime, List> _events;
  List<Reminder> _reminders;
  String locale;
  bool isTest;
  
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    updateEvents(); //carregando eventos antes de criar o calendário
    updateCards(DateTime.now()); //atualiza a informação dos cards
  }

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    //inicializando o local do dispositivo
    bool isEmpty(String s) => s == null || s.isEmpty;
    locale = Localizations.localeOf(context).languageCode.toString();
    locale += isEmpty(Localizations.localeOf(context).countryCode) ? "" : "_" + Localizations.localeOf(context).countryCode.toString().toUpperCase();

    return Scaffold(
        backgroundColor: Color.fromRGBO(253, 224, 224, 1),
        body: bodyData(localization, context));
  }

  Widget bodyData(localization, context){
    List<Widget> _children = [calendar(localization)]; //adiciona o calendário aos componentes do corpo
    List<Widget> remindersCard = getRemindersData(context);
    if(!(remindersCard == null || remindersCard.isEmpty)){
        var it = remindersCard.iterator;
        while (it.moveNext()) {
          _children.add(it.current); //adiciona todos os cards
        }
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(253, 224, 224, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(253, 224, 224, 1),
          title: title(localization),
          elevation: 0.0,
        ),
        body: ListView(
          children: _children,
        )
        
      );
  }

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

  void updateCards(DateTime date){
    //atualiza os lembretes em _reminders
    if(this.isTest){
      Reminder r1 = Reminder(
          id: 1,
          name: 'Medicamento 1',
          dose: 1,
          doseMetric: 'comprimido',
          time: 1,
          obs: 'Observação de administração do medicamento',
          begining: DateTime.now().millisecondsSinceEpoch,
          end: DateTime.now().millisecondsSinceEpoch + 90000000,
          currentDateTime: date.millisecondsSinceEpoch,
      );
      _reminders = [r1];
    }else{
    _reminders = [];
    }
  }

  void updateEvents(){
    _events = {};
    //carrega a lista de eventos
  }

  List<Widget> getRemindersData(BuildContext context){
    if(!(_reminders == null || _reminders.isEmpty)){
      return _reminders.map((r) => CardReminderItem(CardReminder(r), locale, context)).toList();
    }
    return null;
  }
    

}
