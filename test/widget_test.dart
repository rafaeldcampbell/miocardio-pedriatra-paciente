import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miocardio_paciente/functions/localization.dart';
import 'package:miocardio_paciente/main.dart';
import 'package:miocardio_paciente/pages/home.dart';
import 'package:miocardio_paciente/pages/info.dart';
import 'package:miocardio_paciente/pages/questionsPage.dart';
import 'package:miocardio_paciente/pages/reminderPage.dart';

void main() {
// É necessário que, a cada alteração feita nos arquivos string_en e string_pt,
// seja feita uma atualização das verificações

  testWidgets('Testando home (portugues)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('pt')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: Home(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();
    
      // Busca e verificando titulo
      Finder pageTitle = find.text('Inicial');
      expect(pageTitle, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando home (ingles)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('en')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: Home(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();
    
      // Busca e verificando titulo
      Finder pageTitle = find.text('Home');
      expect(pageTitle, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando ask (portugues)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('pt')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: QuestionsPage(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();

      Finder pageTitle = find.text("Perguntas Frequentes");
      expect(pageTitle, findsOneWidget);

      // Busca e verificando perguntas
      Finder q1 = find.text("Qual a relação entre a miocardite e as crianças?");
      expect(q1, findsOneWidget);
      Finder q2 = find.text("O que é miocardite?");
      expect(q2, findsOneWidget);
      Finder q3 = find.text("Quais são as principais causas?");
      expect(q3, findsOneWidget);
      Finder q4 = find.text("O que a inflamação no miocárdio pode provocar?");
      expect(q4, findsOneWidget);
      Finder q5 = find.text("Quais exames podem ser subdiagnosticados?");
      expect(q5, findsOneWidget);

      //Abertura do card
      await tester.tap(q1);
      await tester.pumpAndSettle();
      //Leitura do conteúdo do card
      Finder a1 = find.text("Crianças com Miocardite são normais ao nascer (salvo em casos em que ocorre a miocardite intraútero), e têm o desenvolvimento e crescimento normais na infância, começando a apresentar os sintomas após alguns dias de uma infecção viral inespecífica (como gripe ou diarreia).\n");
      expect(a1, findsOneWidget);
      //Fechamento do card
      await tester.tap(q1);
      await tester.pumpAndSettle();

      //Abertura do card
      await tester.tap(q2);
      await tester.pumpAndSettle();
      //Leitura do conteúdo do card
      Finder a2 = find.text("É a inflamação do músculo do coração, chamado de miocárdio. Esse músculo é responsável pela contração do coração e a inflamação prejudica a ação de bombeamento do sangue provocando arritmias e insuficiência cardíaca. Seu tempo de duração depende da causa da inflamação e do estado de saúde do paciente.\n");
      expect(a2, findsOneWidget);
      //Fechamento do card
      await tester.tap(q2);
      await tester.pumpAndSettle();


      await tester.tap(q3);
      await tester.pumpAndSettle();
      Finder a3 = find.text("Não há uma causa determinante e normalmente decorre de uma complicação de doenças infecciosas causadas por alguns vírus, bactérias, protozoários ou fungos. Podem estar associadas a uso de medicamentos, doenças auto-imunes, consumo exagerado de álcool e drogas.\n");
      expect(a3, findsOneWidget);
      await tester.tap(q3);
      await tester.pumpAndSettle();

      await tester.tap(q4);
      await tester.pumpAndSettle();
      Finder a4 = find.text("A redução na capacidade de bombeamento do sangue pode acarretar no surgimento de arritmias cardíacas. Em casos mais complexos pode haver formação de coágulos no coração levando a um acidente vascular cerebral ou infarto.\n");
      expect(a4, findsOneWidget);
      await tester.tap(q4);
      await tester.pumpAndSettle();

      await tester.tap(q5);
      await tester.pumpAndSettle();
      Finder a5 = find.text("   * O hemograma é inespecífico e pode estar normal\n  * O ecocardiograma pode ser normal\n");
      expect(a5, findsOneWidget);
      await tester.tap(q5);
      await tester.pumpAndSettle();
      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando ask (ingles)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('en')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: QuestionsPage(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();

      Finder pageTitle = find.text("Questions & Answers");
      expect(pageTitle, findsOneWidget);

      // Busca e verificando perguntas
      Finder q1 = find.text("What is the relationship between myocarditis and children?");
      expect(q1, findsOneWidget);
      Finder q2 = find.text("What is myocarditis?");
      expect(q2, findsOneWidget);
      Finder q3 = find.text("What are the main causes?");
      expect(q3, findsOneWidget);
      Finder q4 = find.text("What causes myocardial inflammation?");
      expect(q4, findsOneWidget);
      Finder q5 = find.text("Which tests can be underdiagnosed?");
      expect(q5, findsOneWidget);

      //abre card de resposta
      await tester.tap(q1);
      await tester.pumpAndSettle();
      Finder a1 = find.text("Children with myocarditis are normal at birth (except in cases of intrauterine myocarditis), and have normal development and growth in childhood, beginning to show symptoms after a few days of nonspecific viral infection (such as flu or diarrhea).\n");
      expect(a1, findsOneWidget);
      await tester.tap(q1);
      await tester.pumpAndSettle();

      await tester.tap(q2);
      await tester.pumpAndSettle();
      Finder a2 = find.text("It is inflammation of the heart muscle, called the myocardium. This muscle is responsible for the contraction of the heart and inflammation impairs the pumping action of the blood causing arrhythmias and heart failure. Its duration depends on the cause of the inflammation and the health of the patient.\n");
      expect(a2, findsOneWidget);
      await tester.tap(q2);
      await tester.pumpAndSettle();

      await tester.tap(q3);
      await tester.pumpAndSettle();
      Finder a3 = find.text("There is no determining cause and is usually due to a complication of infectious diseases caused by some viruses, bacteria, protozoa or fungi. They may be associated with medication use, autoimmune diseases, excessive alcohol and drug use.\n");
      expect(a3, findsOneWidget);
      await tester.tap(q3);
      await tester.pumpAndSettle();

      await tester.tap(q4);
      await tester.pumpAndSettle();
      Finder a4 = find.text("Reduced blood pumping capacity may lead to cardiac arrhythmias. In more complex cases there may be clot formation in the heart leading to a stroke or infarction.\n");
      expect(a4, findsOneWidget);
      await tester.tap(q4);
      await tester.pumpAndSettle();      
      
      await tester.tap(q5);
      await tester.pumpAndSettle();
      Finder a5 = find.text("   * CBC is nonspecific and may be normal\n   * Echocardiogram may be normal\n");
      expect(a5, findsOneWidget);
      await tester.tap(q5);
      await tester.pumpAndSettle();

      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando reminder (portugues)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('pt')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: ReminderPage(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();
    
      // Busca e verificando titulo
      Finder pageTitle = find.text('Lembretes');
      expect(pageTitle, findsOneWidget);
      //Verifica a presenca do Calendario
      Finder calendar = find.byKey(Key("calendarKey"));
      expect(calendar, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando reminder (ingles)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('en')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: ReminderPage(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();
    
      // Busca e verificando titulo
      Finder pageTitle = find.text('Reminder');
      expect(pageTitle, findsOneWidget);
      
      //Verifica a presenca do Calendario
      Finder calendar = find.byKey(Key("calendarKey"));
      expect(calendar, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando info (portugues)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('pt')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: Info(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();
    
      // Busca e verificando titulo
      Finder pageTitle = find.text('Informações');
      expect(pageTitle, findsOneWidget);

      // Verificando texto das tabs
      Finder tabTitleSymptoms = find.text('Sintomas');
      Finder tabTitleActivities = find.text('Atividades');
      expect(tabTitleSymptoms, findsOneWidget);
      expect(tabTitleActivities, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });
  testWidgets('Testando info (ingles)', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(isTest: true, testLocale : Locale('en')), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: Info(),
                                  ),
                                );
      // constroi o widget
      await tester.pumpWidget(widget);
      await tester.idle();
      await tester.pumpAndSettle();
    
      // Busca e verificando titulo
      Finder pageTitle = find.text('Information');
      expect(pageTitle, findsOneWidget);

      //verificando texto das tabs
      Finder tabTitleSymptoms = find.text('Symptoms');
      Finder tabTitleActivities = find.text('Activities');
      expect(tabTitleSymptoms, findsOneWidget);
      expect(tabTitleActivities, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });

  testWidgets('Testando inicialização do sistema', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Widget widget = MediaQuery(
                                  data: MediaQueryData(),
                                  child: MaterialApp(
                                    localizationsDelegates: [
                                      LocalizationDelegate(), 
                                      GlobalMaterialLocalizations.delegate, 
                                      GlobalWidgetsLocalizations.delegate,
                                    ],
                                    home: MyApp(),
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
      Finder navigationBar = find.byKey(Key("navigationBar"));

      Finder pagetitleHome = find.byKey(Key("pagetitleHome"));
      Finder pagetitleAsk = find.byKey(Key("pagetitleAsk"));
      Finder pagetitleReminder = find.byKey(Key("pagetitleReminder"));
      Finder pagetitleInfo = find.byKey(Key("pagetitleInfo"));
    
      // Busca o título e verifica se está em Home
      expect(pagetitleHome, findsOneWidget);
      expect(pagetitleAsk, findsNothing);
      expect(pagetitleReminder, findsNothing);
      expect(pagetitleInfo, findsNothing);

      //procura a barra de navegação
      expect(navigationBar, findsOneWidget);
      
      //procura todos os botões na barra de navegação
      expect(findHomeButton, findsOneWidget);
      expect(findAskButton, findsOneWidget);
      expect(findReminderButton, findsOneWidget);
      expect(findInfoButton, findsOneWidget);
      print("-------------------------------- APROVADO");
    });
  });

}
