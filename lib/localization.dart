import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {

  Localization(this._locale);

  final Locale _locale;
  Map<String, dynamic> _sentences;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  Future<bool> load() async {
    String data = await rootBundle.loadString('assets/res/string/string_${_locale.languageCode}.json');
    this._sentences = json.decode(data);
    return true;
  }

  String trans(String key) {
    if (key == null) {
      return '...';
    }
    return this._sentences[key];
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  
  const LocalizationDelegate({
    this.isTest = false,
    this.testLocale = const Locale('pt'),

  });
  final bool isTest;
  final Locale testLocale;

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    Localization localizations;
    if (this.isTest) {
      localizations = new Localization(this.testLocale);
    } else {
      localizations = new Localization(locale);
    }
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}