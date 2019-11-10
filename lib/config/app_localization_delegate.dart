import 'package:flutter/cupertino.dart';
import 'package:ponder_sliders/config/app_localization.dart';
import 'package:ponder_sliders/config/localization_change_provider.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  final Locale newLocale;

  const AppLocalizationDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return LocalizationChangeProvider.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) {
    return AppLocalization.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) {
    return true;
  }

}