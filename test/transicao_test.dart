import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miocardio_paciente/functions/navigatorBar.dart';
import 'package:miocardio_paciente/functions/localization.dart';

void main() {

  testWidgets('Testando transição de telas', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('pt')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: NavigationBar(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();

      Finder findHomeButton = find.byKey(Key('navigationHome'));
      Finder findAskButton = find.byKey(Key('navigationAsk'));
      Finder findReminderButton = find.byKey(Key('navigationReminder'));
      Finder findInfoButton = find.byKey(Key('navigationInfo'));

      Finder pagetitleHome = find.byKey(Key("pagetitleHome"));
      Finder pagetitleAsk = find.byKey(Key("pagetitleAsk"));
      Finder pagetitleReminder = find.byKey(Key("pagetitleReminder"));
      Finder pagetitleInfo = find.byKey(Key("pagetitleInfo"));
    
      // Busca o título e verifica se está em Home
      expect(pagetitleHome, findsOneWidget);
      expect(pagetitleAsk, findsNothing);
      expect(pagetitleReminder, findsNothing);
      expect(pagetitleInfo, findsNothing);




      //-------------  HOME -> ASK

      //busca e verifica se encontra o botão para ir para Ask
      expect(findAskButton, findsOneWidget);
      //clica no botão para ir para ask
      await tester.tap(findAskButton);
      await tester.pumpAndSettle();
      //busca o título e verifica se está em ask
      expect(pagetitleHome, findsNothing);
      expect(pagetitleAsk, findsOneWidget);
      expect(pagetitleReminder, findsNothing);
      expect(pagetitleInfo, findsNothing);




      //-------------  ASK -> REMINDER

      //busca e verifica se encontra o botão para ir para reminder
      expect(findReminderButton, findsOneWidget);
      //clica no botão para ir para reminder
      await tester.tap(findReminderButton);
      await tester.pumpAndSettle();
      //busca o título e verifica se está em reminder
      expect(pagetitleHome, findsNothing);
      expect(pagetitleAsk, findsNothing);
      expect(pagetitleReminder, findsOneWidget);
      expect(pagetitleInfo, findsNothing);
      




      //-------------  REMINDER -> INFO

      //busca e verifica se encontra o botão para ir para info
      expect(findInfoButton, findsOneWidget);
      //clica no botão para ir para info
      await tester.tap(findInfoButton);
      await tester.pumpAndSettle();
      //busca o título e verifica se está em info
      expect(pagetitleHome, findsNothing);
      expect(pagetitleAsk, findsNothing);
      expect(pagetitleReminder, findsNothing);
      expect(pagetitleInfo, findsOneWidget);





    //-------------  INFO -> HOME

      //busca e verifica se encontra o botão para ir para home
      expect(findHomeButton, findsOneWidget);
      //clica no botão para ir para home
      await tester.tap(findHomeButton);
      await tester.pumpAndSettle();
      // Busca o título e verifica se está em Home
      expect(pagetitleHome, findsOneWidget);
      expect(pagetitleAsk, findsNothing);
      expect(pagetitleReminder, findsNothing);
      expect(pagetitleInfo, findsNothing);
      print("-------------------------------- APROVADO");
    });
  });
}
