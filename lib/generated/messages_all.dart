// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

final _$en = $en();

class $en extends MessageLookupByLibrary {
  get localeName => 'en';
  
  final messages = {
		"updateGenLang" : MessageLookupByLibrary.simpleMessage("flutter pub run gen_lang:generate"),
		"navBarHome" : MessageLookupByLibrary.simpleMessage("Home"),
		"navBarAsk" : MessageLookupByLibrary.simpleMessage("Ask"),
		"navBarReminder" : MessageLookupByLibrary.simpleMessage("Reminder"),
		"navBarInfo" : MessageLookupByLibrary.simpleMessage("Info"),
		"pagetitleHome" : MessageLookupByLibrary.simpleMessage("Home"),
		"pagetitleAsk" : MessageLookupByLibrary.simpleMessage("Questions & Answers"),
		"pagetitleReminder" : MessageLookupByLibrary.simpleMessage("Reminder"),
		"pagetitleInfo" : MessageLookupByLibrary.simpleMessage("Information"),
		"askQuestion01" : MessageLookupByLibrary.simpleMessage("Qual a diferença entre miocardia e miocardite?"),
		"askAnswer01" : MessageLookupByLibrary.simpleMessage("Section 01"),
		"askQuestion02" : MessageLookupByLibrary.simpleMessage("O que é miocardite?"),
		"askAnswer02" : MessageLookupByLibrary.simpleMessage("É a inflamação do músculo do coração, chamado de miocárdio. Esse músculo é responsável pela contração do coração e a inflamação prejudica a ação de bombeamento do sangue provocando arritmias e insuficiência cardíaca. Seu tempo de duração depende da causa da inflamação e do estado de saúde do paciente."),
		"askQuestion03" : MessageLookupByLibrary.simpleMessage("O que miocardiopatia isquêmica?"),
		"askAnswer03" : MessageLookupByLibrary.simpleMessage("Section 03"),
		"askQuestion04" : MessageLookupByLibrary.simpleMessage("O que causa a inflamação no miocárdio?"),
		"askAnswer04" : MessageLookupByLibrary.simpleMessage("Section 04"),
		"askQuestion05" : MessageLookupByLibrary.simpleMessage("O que é cardiopatia congênita?"),
		"askAnswer05" : MessageLookupByLibrary.simpleMessage("Section 05"),
		"loginMailHint" : MessageLookupByLibrary.simpleMessage("Email"),
		"loginPasswordHint" : MessageLookupByLibrary.simpleMessage("Password"),
		"loginButton" : MessageLookupByLibrary.simpleMessage("Sign in"),
		"loginWarningMailIncorrect" : MessageLookupByLibrary.simpleMessage("Incorrect email!"),
		"loginWarningPasswordIncorrect" : MessageLookupByLibrary.simpleMessage("Incorrect password!"),
		"loginWarningBothIncorrect" : MessageLookupByLibrary.simpleMessage("Both email and password are incorrect!"),

  };
}

final _$pt = $pt();

class $pt extends MessageLookupByLibrary {
  get localeName => 'pt';
  
  final messages = {
		"updateGenLang" : MessageLookupByLibrary.simpleMessage("flutter pub run gen_lang:generate"),
		"navBarHome" : MessageLookupByLibrary.simpleMessage("Inicial"),
		"navBarAsk" : MessageLookupByLibrary.simpleMessage("Perguntas"),
		"navBarReminder" : MessageLookupByLibrary.simpleMessage("Lembretes"),
		"navBarInfo" : MessageLookupByLibrary.simpleMessage("Info"),
		"pagetitleHome" : MessageLookupByLibrary.simpleMessage("Inicial"),
		"pagetitleAsk" : MessageLookupByLibrary.simpleMessage("Perguntas frequentes"),
		"pagetitleReminder" : MessageLookupByLibrary.simpleMessage("Lembretes"),
		"pagetitleInfo" : MessageLookupByLibrary.simpleMessage("Informações"),
		"askQuestion01" : MessageLookupByLibrary.simpleMessage("Qual a diferença entre miocardia e miocardite?"),
		"askAnswer01" : MessageLookupByLibrary.simpleMessage("Section 01"),
		"askQuestion02" : MessageLookupByLibrary.simpleMessage("O que é miocardite?"),
		"askAnswer02" : MessageLookupByLibrary.simpleMessage("É a inflamação do músculo do coração, chamado de miocárdio. Esse músculo é responsável pela contração do coração e a inflamação prejudica a ação de bombeamento do sangue provocando arritmias e insuficiência cardíaca. Seu tempo de duração depende da causa da inflamação e do estado de saúde do paciente."),
		"askQuestion03" : MessageLookupByLibrary.simpleMessage("O que miocardiopatia isquêmica?"),
		"askAnswer03" : MessageLookupByLibrary.simpleMessage("Section 03"),
		"askQuestion04" : MessageLookupByLibrary.simpleMessage("O que causa a inflamação no miocárdio?"),
		"askAnswer04" : MessageLookupByLibrary.simpleMessage("Section 04"),
		"askQuestion05" : MessageLookupByLibrary.simpleMessage("O que é cardiopatia congênita?"),
		"askAnswer05" : MessageLookupByLibrary.simpleMessage("Section 05"),
		"loginMailHint" : MessageLookupByLibrary.simpleMessage("Email"),
		"loginPasswordHint" : MessageLookupByLibrary.simpleMessage("Senha"),
		"loginButton" : MessageLookupByLibrary.simpleMessage("Entrar"),
		"loginWarningMailIncorrect" : MessageLookupByLibrary.simpleMessage("O email está incorreto!"),
		"loginWarningPasswordIncorrect" : MessageLookupByLibrary.simpleMessage("A senha está incorreta!"),
		"loginWarningBothIncorrect" : MessageLookupByLibrary.simpleMessage("O email e a senha estão incorretos!"),

  };
}



typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
	"en": () => Future.value(null),
	"pt": () => Future.value(null),

};

MessageLookupByLibrary _findExact(localeName) {
  switch (localeName) {
    case "en":
        return _$en;
    case "pt":
        return _$pt;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
