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

  Widget pageSymptoms(localization) =>
    Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
    );

  Widget pageActivities(localization) =>
    Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
    );
    
}

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
