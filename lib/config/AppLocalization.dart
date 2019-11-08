import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  Locale _locale;
  static Map<dynamic, dynamic> _localisedValues;

  AppLocalization(this._locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Future<AppLocalization> load(Locale locale) async {
    AppLocalization appTranslations = AppLocalization(locale);
    String jsonContent =
    await rootBundle.loadString("assets/locale/localization_${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => _locale.languageCode;

  String text(String key) {
    return _localisedValues[key] ?? "$key not found";
  }
}