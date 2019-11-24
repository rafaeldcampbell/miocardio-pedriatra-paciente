import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miocardio_paciente/functions/localization.dart';
import 'package:intl/intl.dart';

class AddReminderPage extends StatefulWidget {
  AddReminderPageState createState() => AddReminderPageState();
}

class AddReminderPageState extends State<AddReminderPage> {

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
      appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black, size: 30,),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          backgroundColor: Color.fromRGBO(253, 224, 224, 1),
          title: title(localization),
          centerTitle: true,
          elevation: 0.0,
        ),
      body: bodyData(localization, context),
    );
  }

  Widget title(localization) => Center(
        child: Text(localization.trans('pagetitleAddReminder'),
            key: Key("pagetitleAddReminder"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      );

  Widget bodyData(localization, context) =>
    ListView(
      padding: EdgeInsets.only(bottom: 15, top: 15, left: 20, right: 20),
      children: <Widget>[
        editText("Nome", 1),
        editTextNumber("Posologia"),
        editText("Complemento da posologia", 1),
        editTextNumber("Intervalo em horas"),
        editText("Observação", 3),
        addTimePicker("Início:  ", context),
        addDayPicker("Início:  ", context),
        addTimePicker("Fim:  ", context),
        addDayPicker("Fim:  ", context),
        addReminderButton(localization)
      ],
    );

  Widget editText(lable, maxLines) =>
    Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        TextField(
          maxLines: maxLines,
          decoration: 
            InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1,color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                borderSide: BorderSide(width: 1,color: Colors.grey),
              ),
              labelText: lable,
              labelStyle: TextStyle(color: Colors.black, fontSize: 15)
            )
          )
    );

    Widget editTextNumber(lable) =>
    Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: 
            <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
            ],
          decoration: 
            InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1,color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                borderSide: BorderSide(width: 1,color: Colors.grey),
              ),
              labelText: lable,
              labelStyle: TextStyle(color: Colors.black, fontSize: 15)
            )
          )
    );

  Widget addReminderButton(localization) => 
    Column(
      children: <Widget>[
        MaterialButton( 
          height: 50.0, 
          minWidth: 200.0, 
          shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Color.fromRGBO(249, 124, 124, 1),)),
          color: Color.fromRGBO(249, 124, 124, 0.3),
          elevation: 0,
          textColor: Colors.white,
          child: Text(localization.trans("reminderAddButton"), style: TextStyle(color: Colors.black, fontSize: 20),),
          onPressed: () {print("Add");},
          splashColor: Colors.redAccent,
          highlightColor: Color.fromRGBO(249, 124, 124, 0.3),
          highlightElevation: 0,
          ),
          SizedBox(height: 10,)
      ]
    );

  Future<Null> _selectDay(BuildContext context) async {
    final DateTime picked_d = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2018),
                                      lastDate: DateTime(2030),
                                      builder: (BuildContext context, Widget child) {
                                        return Theme(
                                          data: ThemeData.dark(),
                                          child: child,
                                        );
                                      },
                                    );

    if (picked_d != null && picked_d != selectedDay )
      setState(() {
        selectedDay = picked_d;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child,
            );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }

  Widget addTimePicker(s, context) => 
  Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        MaterialButton( 
          height: 50.0, 
          minWidth: 200.0, 
          shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.grey,)),
          elevation: 0,
          textColor: Colors.white,
          child: Text(s + selectedTime.format(context), style: TextStyle(color: Colors.black, fontSize: 20),),
          onPressed: () {
            _selectTime(context);
          },
          splashColor: Colors.redAccent,
          highlightColor: Color.fromRGBO(249, 124, 124, 0.0),
          highlightElevation: 0,
          )
  );
  
  Widget addDayPicker(s, context) => 
  Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        MaterialButton( 
          height: 50.0, 
          minWidth: 200.0, 
          shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.grey,)),
          elevation: 0,
          textColor: Colors.white,
          child: Text(s + DateFormat("dd/MM/yy").format(selectedDay), style: TextStyle(color: Colors.black, fontSize: 20),),
          onPressed: () {
            _selectDay(context);
          },
          splashColor: Colors.redAccent,
          highlightColor: Color.fromRGBO(249, 124, 124, 0.0),
          highlightElevation: 0,
          )
  );

}
