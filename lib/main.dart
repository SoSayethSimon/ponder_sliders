import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ponder_sliders/config/app_localization_delegate.dart';
import 'package:ponder_sliders/config/localization_change_provider.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:ponder_sliders/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(builder: (context) => ListModel(), child: MyApp()));

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  AppLocalizationDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppLocalizationDelegate(newLocale: null);
    localizationChangeProvider.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ponder Sliders',
      theme: ThemeData.light(),
      home: LandingPage('Ponder Sliders'),
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: localizationChangeProvider.supportedLocales(),
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppLocalizationDelegate(newLocale: locale);
    });
  }
}
