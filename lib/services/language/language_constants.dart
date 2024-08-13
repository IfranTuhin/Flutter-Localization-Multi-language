import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LANGUAGE_CODE = 'languageCode';

// Language code
const String ENGLISH = 'en';
const String BENGALI = 'bn';
const String HINDI = 'hi';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, 'US');
    case BENGALI:
      return const Locale(BENGALI, 'BN');
    case HINDI:
      return const Locale(HINDI, 'HI');
    case ARABIC:
      return const Locale(ARABIC, 'AR');
    default:
      return const Locale(ENGLISH, 'US');
  }
}

AppLocalizations translation (BuildContext context) {
  return AppLocalizations.of(context)!;
}
