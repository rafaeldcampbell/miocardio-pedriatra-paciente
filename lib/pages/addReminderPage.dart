import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miocardio_paciente/functions/localization.dart';
import 'package:intl/intl.dart';

class AddReminderPage extends StatefulWidget {
  AddReminderPageState createState() => AddReminderPageState();
}

class AddReminderPageState extends State<AddReminderPage> {

  DateFormat dateFormat = DateFormat("dd/MM/yyyy -- HH:mm");

  TextEditingController nameController = new TextEditingController();
  TextEditingController doseController = new TextEditingController();
  TextEditingController doseMetricController = new TextEditingController();
  TextEditingController timeIntervalController = new TextEditingController();
  TextEditingController obsController = new TextEditingController();
  TextEditingController beginController = new TextEditingController();
  TextEditingController endController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    beginController.text = dateFormat.format(DateTime.now());
    endController.text = dateFormat.format(DateTime.now());
  }

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
        editText("Nome", 1, nameController),
        editTextNumber("Posologia", doseController),
        editText("Complemento da posologia", 1, doseMetricController),
        editTextNumber("Intervalo em horas", timeIntervalController),
        editText("Observação", 3, obsController),
        editText("Início", 1, beginController, readOnly: true),
        addDayTimePicker(context, beginController),
        editText("Fim", 1, endController, readOnly: true),
        addDayTimePicker(context, endController),
        addReminderButton(localization)
      ],
    );

  Widget editText(lable, maxLines, controller, {readOnly = false}) =>
    Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        TextField(
          readOnly: readOnly,
          controller: controller,
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

    Widget editTextNumber(lable, controller) =>
    Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        TextField(
          controller: controller,
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

  Widget editTextBlocked(lable, maxLines) =>
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

  Future<Null> _selectDay(BuildContext context, TextEditingController dateText) async {
    DateTime date = dateFormat.parse(dateText.text);
    final DateTime picked_d = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(2018),
                                      lastDate: DateTime(2030),
                                      builder: (BuildContext context, Widget child) {
                                        return Theme(
                                          data: ThemeData.dark(),
                                          child: child,
                                        );
                                      },
                                    );
    if (picked_d != null)
      setState(() {
        dateText.text = dateFormat.format(DateTime(picked_d.year, picked_d.month, picked_d.day, date.hour, date.minute));
      });
  }

  Future<Null> _selectTime(BuildContext context, TextEditingController dateText) async {
    DateTime date = dateFormat.parse(dateText.text);
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: date.hour, minute: date.minute), builder: (BuildContext context, Widget child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child,
            );});
    if (picked_s != null )
      setState(() {
        dateText.text = dateFormat.format( DateTime(date.year, date.month, date.day, picked_s.hour, picked_s.minute) );
      });
  }

  Widget addDayTimePicker(context, date) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        addDayPicker(context, date),
        SizedBox(width: 30,),
        addTimePicker(context, date)
      ],
    );

  Widget addTimePicker(context, date) => 
  Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        MaterialButton( 
          height: 50.0, 
          minWidth: 100.0, 
          shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.grey,)),
          elevation: 0,
          textColor: Colors.white,
          child: Text("Horário", style: TextStyle(color: Colors.black, fontSize: 20),),
          onPressed: () {
            _selectTime(context, date);
          },
          splashColor: Colors.redAccent,
          highlightColor: Color.fromRGBO(249, 124, 124, 0.0),
          highlightElevation: 0,
          )
  );
  
  Widget addDayPicker(context, date) => 
  Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
        MaterialButton( 
          height: 50.0, 
          minWidth: 100.0, 
          shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.grey,)),
          elevation: 0,
          textColor: Colors.white,
          child: Text("Data", style: TextStyle(color: Colors.black, fontSize: 20),),
          onPressed: () {
            _selectDay(context, date);
          },
          splashColor: Colors.redAccent,
          highlightColor: Color.fromRGBO(249, 124, 124, 0.0),
          highlightElevation: 0,
          )
  );

}
