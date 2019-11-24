import 'package:flutter/material.dart';
import 'package:miocardio_paciente/functions/localization.dart' show Localization;

class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
      body: 
        bodyData(localization)
    );
  }

  // contem toda a informação do corpo da aplicação
  Widget bodyData(localization) =>
        DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color.fromRGBO(253, 224, 224, 1),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(253, 224, 224, 1),
              bottom: WhiteTabBar(localization),
              title: title(localization),
            ),
            body: TabBarView(
              children: [
                pageSymptoms(localization),
                pageActivities(localization),
              ],
            ),
          ),
        );

  //retorna o título da tela
  Widget title(localization) =>
  Center(
    child: 
      Text(
          localization.trans('pagetitleInfo'),
          key : Key("pagetitleInfo"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )
      ),
    );

  // gerencia o ListView com as informações da tela de sintomas
  Widget pageSymptoms(localization) =>
    Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
      body: ListView(
        padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
        children: 
          getSymptomsData(localization),
      )
    );

  // gerencia o listView com as informaçoes da tela de atividade
  Widget pageActivities(localization) =>
    Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
      body: ListView(
        padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
        children: 
          getActivitiesData(localization),
      )
    );
    
  // retorna a lista de cards para sintomas
  List<Widget> getSymptomsData(localization) => 
    [
      CardItem(CardInfo(localization.trans('infoSymptomsText1'), Icons.priority_high)),
      CardItem(CardInfo(localization.trans('infoSymptomsText2'), Icons.calendar_today)),
      CardItem(CardInfo(localization.trans('infoSymptomsText3'), Icons.favorite_border)),
      CardItem(CardInfo(localization.trans('infoSymptomsText4'), Icons.child_care)),
      CardItem(CardInfo(localization.trans('infoSymptomsText5'), Icons.hotel)),

      ];

  // retorna a lista de cards para atividade
  List<Widget> getActivitiesData(localization) => 
    [
      CardItem(CardInfo(localization.trans('infoActivitiesText1'), Icons.cloud)),
      CardItem(CardInfo(localization.trans('infoActivitiesText2'), Icons.cloud)),
      CardItem(CardInfo(localization.trans('infoActivitiesText3'), Icons.cloud)),
      ];
}





//======================= CARD =======================================

// contem a informação que será usada no card
class CardInfo {
  CardInfo(this.text, this.icon);
  final String text;
  final IconData icon;
}
// descreve o componente visual do card
class CardItem extends StatelessWidget {
  const CardItem(this.cardInfo);

  final CardInfo cardInfo;

  //constroi o card
  Widget _buildCard(CardInfo root) {
    return new Container(
        padding: EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
        child:
          SizedBox(
            width:  double.infinity,
            height: 115.0,
            child:
              Card(
                key: PageStorageKey<CardInfo>(root),
                child: 
                Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child:
                    Row(
                      children: <Widget>[
                        Icon(root.icon, size: 80, color: Color.fromRGBO(100, 100, 100, 0.4),),
                        SizedBox(width: 15,),
                        Flexible( child: Text(root.text, textAlign: TextAlign.left, style: TextStyle(fontSize:  15),))
                        ],
                      ),
                )
              )
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard(cardInfo);
  }
}






// ============================ TAB =============================

// é o componente que desenha as tabs com o fundo branco
class WhiteTabBar extends Container implements PreferredSizeWidget {
  WhiteTabBar(this.localization){
    _tabBar = getTabBar(localization);
  }

  final Localization localization;
  final Color _color = Color.fromRGBO(255, 255, 255, 1);
  TabBar _tabBar;

  static TabBar getTabBar(localization) => 
        TabBar(
                labelStyle: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                indicatorColor: Color.fromRGBO(255, 100, 100, 1),
                labelColor: Color.fromRGBO(0, 0, 0, 1),
                unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
                tabs: [
                  Tab(text: localization.trans('infoSymptomsTitle')),
                  Tab(text: localization.trans('infoActivitiesTitle')),
                ],
              );

  @override
  Size get preferredSize => _tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: _color,
    child: _tabBar,
  );
}
