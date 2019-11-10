import 'dart:ui';

class LocalizationChangeProvider {
  static final LocalizationChangeProvider _localizationChangeProvider = LocalizationChangeProvider._internal();

  factory LocalizationChangeProvider() {
    return _localizationChangeProvider;
  }

  LocalizationChangeProvider._internal();

  static final List<String> supportedLanguages = [
    "English",
    "German",
  ];

  static final List<String> supportedLanguagesCodes = [
    "en",
    "de",
  ];

  final Map<String, String> namesForLanguageCodes =
    Map.fromIterables(supportedLanguagesCodes, supportedLanguages);
  
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  LocaleChangeCallback onLocaleChanged;
}
LocalizationChangeProvider localizationChangeProvider = LocalizationChangeProvider();

typedef void LocaleChangeCallback(Locale locale);