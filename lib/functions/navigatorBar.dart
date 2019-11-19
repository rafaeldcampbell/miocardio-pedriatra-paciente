import 'package:flutter/material.dart';
import 'package:miocardio_paciente/pages/questionsPage.dart';
import 'package:miocardio_paciente/pages/home.dart';
import 'package:miocardio_paciente/pages/info.dart';
import 'package:miocardio_paciente/pages/reminderPage.dart';
import 'package:miocardio_paciente/localization.dart' show Localization;

//Classe responsável somente pelo NavigationBottomBar
//Essa classe chama a renderização das outras abas (classes states)

class NavigationBar extends StatefulWidget {
  //Tem que ser Stateful porque muda de estado
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<NavigationBar> {
  int _currentIndex = 0; //Aba em que o app abre isto é, a "Home"
  final List<Widget> _children = [
    //Classes das abas
    Home(),
    QuestionsPage(),
    ReminderPage(),
    Info(),
  ];


  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex], //Corpo correspondente ao widget que será amostrado
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap:onTabTapped, //Chama OnTabTapped que pega o index da aba que é tocada
        currentIndex: _currentIndex, //Widget que será renderizado
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text(localization.trans('navBarHome'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.help_outline),
            title: new Text(localization.trans('navBarAsk')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text(localization.trans('navBarReminder')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text(localization.trans('navBarInfo')),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    //Função responsável por ver o que está sendo tocado e trocar o index
    setState(() {
      _currentIndex = index;
    });
  }
}
