// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'messages_all.dart';

class S {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }
  
  static Future<S> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }
  
  String get updateGenLang {
    return Intl.message("flutter pub run gen_lang:generate", name: 'updateGenLang');
  }

  String get navBarHome {
    return Intl.message("Home", name: 'navBarHome');
  }

  String get navBarAsk {
    return Intl.message("Ask", name: 'navBarAsk');
  }

  String get navBarReminder {
    return Intl.message("Reminder", name: 'navBarReminder');
  }

  String get navBarInfo {
    return Intl.message("Info", name: 'navBarInfo');
  }

  String get pagetitleHome {
    return Intl.message("Home", name: 'pagetitleHome');
  }

  String get pagetitleAsk {
    return Intl.message("Questions & Answers", name: 'pagetitleAsk');
  }

  String get pagetitleReminder {
    return Intl.message("Reminder", name: 'pagetitleReminder');
  }

  String get pagetitleInfo {
    return Intl.message("Information", name: 'pagetitleInfo');
  }

  String get askQuestion01 {
    return Intl.message("Qual a diferença entre miocardia e miocardite?", name: 'askQuestion01');
  }

  String get askAnswer01 {
    return Intl.message("Section 01", name: 'askAnswer01');
  }

  String get askQuestion02 {
    return Intl.message("O que é miocardite?", name: 'askQuestion02');
  }

  String get askAnswer02 {
    return Intl.message("É a inflamação do músculo do coração, chamado de miocárdio. Esse músculo é responsável pela contração do coração e a inflamação prejudica a ação de bombeamento do sangue provocando arritmias e insuficiência cardíaca. Seu tempo de duração depende da causa da inflamação e do estado de saúde do paciente.", name: 'askAnswer02');
  }

  String get askQuestion03 {
    return Intl.message("O que miocardiopatia isquêmica?", name: 'askQuestion03');
  }

  String get askAnswer03 {
    return Intl.message("Section 03", name: 'askAnswer03');
  }

  String get askQuestion04 {
    return Intl.message("O que causa a inflamação no miocárdio?", name: 'askQuestion04');
  }

  String get askAnswer04 {
    return Intl.message("Section 04", name: 'askAnswer04');
  }

  String get askQuestion05 {
    return Intl.message("O que é cardiopatia congênita?", name: 'askQuestion05');
  }

  String get askAnswer05 {
    return Intl.message("Section 05", name: 'askAnswer05');
  }

  String get loginMailHint {
    return Intl.message("Email", name: 'loginMailHint');
  }

  String get loginPasswordHint {
    return Intl.message("Password", name: 'loginPasswordHint');
  }

  String get loginButton {
    return Intl.message("Sign in", name: 'loginButton');
  }

  String get loginWarningMailIncorrect {
    return Intl.message("Incorrect email!", name: 'loginWarningMailIncorrect');
  }

  String get loginWarningPasswordIncorrect {
    return Intl.message("Incorrect password!", name: 'loginWarningPasswordIncorrect');
  }

  String get loginWarningBothIncorrect {
    return Intl.message("Both email and password are incorrect!", name: 'loginWarningBothIncorrect');
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
			Locale("en", ""),
			Locale("pt", ""),

    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) =>
    locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}
