// contem a informação que será usada no card
import 'package:flutter/material.dart';
import 'package:miocardio_paciente/database/reminder.dart';
import 'package:intl/intl.dart';

class CardReminder {
  CardReminder(this.reminder);
  final Reminder reminder;
}
// descreve o componente visual do card
class CardReminderItem extends StatelessWidget {
  const CardReminderItem(this.cardReminder, this.locale, this.context);

  final CardReminder cardReminder;
  final String locale;
  final BuildContext context;

  //constroi o card
  Widget _buildCard(CardReminder root) {
    return new Container(
        padding: EdgeInsets.only(top: 0.0, right: 7.0, left: 7.0, bottom: 6.0),
        child:
          SizedBox(
            width:  double.infinity,
            height: 170.0,
            child:
              Card(
                child: 
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, top:15.0, bottom: 15.0),
                    child:
                      Row(
                        children: <Widget>[
                            getDataWidget(DateTime.fromMillisecondsSinceEpoch(root.reminder.currentDateTime)),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width - 135,
                              child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    getMedicineName(),
                                    getMedicineDose(),
                                    getMedicineObs()
                                  ],
                                )
                            )
                          ],
                        ),
                  )
              )
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard(cardReminder);
  }

  Widget getDataWidget(DateTime date){
    String currentDate = date.day.toString() + '\n' + 
        DateFormat.MMMM(locale).format(date).toString().substring(0,3) + '\n' + 
        DateFormat.Hm().format(date);
    return 
      Container(
        decoration: 
          BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 4.0,
            ),
          ),
        child: 
          SizedBox(
            height: 90,
            width: 60,
            child: 
                getDateTimeString(currentDate),
          ),
      );
  }

  Widget getDateTimeString(string) => Center(
        child: Text(string,
            key: Key("cardReminderTimeString"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );

  Widget getMedicineName() => 
    Text(cardReminder.reminder.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.fade,
            softWrap: false,
  );

  Widget getMedicineDose() => 
    Text(cardReminder.reminder.dose.toString() + ' ' + cardReminder.reminder.doseMetric,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            overflow: TextOverflow.fade,
            softWrap: false,
  );

  Widget getMedicineObs() => 
    Text(cardReminder.reminder.obs,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            overflow: TextOverflow.fade,
            softWrap: true,
            maxLines: 3,
  );
}


