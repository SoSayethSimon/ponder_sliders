import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/config/AppLocalization.dart';
import 'package:ponder_sliders/config/LocalizationChangeProvider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  String _templateDropdown = "Placeholder";
  Locale _localeDropdown;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_localeDropdown == null) _localeDropdown = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).text("SETTINGS")),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Row(children: [
                  Expanded(
                      child: DropdownButton(
                    value: _templateDropdown,
                    items: [
                      DropdownMenuItem(
                          child: Text("Placeholder"), value: "Placeholder"),
                      DropdownMenuItem(child: Text("Just a test"), value: "1"),
                      DropdownMenuItem(child: Text("Second test"), value: "2"),
                    ],
                    onChanged: (String newValue) {
                      setState(() {
                        _templateDropdown = newValue;
                      });
                    },
                  ))
                ]),
                Row(children: [
                  Expanded(child: RaisedButton(child: Text(AppLocalization.of(context).text("LOAD-TEMPLATE"))))
                ]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: <Widget>[
                Text(AppLocalization.of(context).text("MAX-VALUE")),
                Expanded(
                    child: Padding(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                  padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
                )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: <Widget>[
                Text(AppLocalization.of(context).text("LOCALE-SETTING")),
                Expanded(
                  child: Padding(
                    child: DropdownButton(
                      value: _localeDropdown,
                      onChanged: (Locale locale) {
                        setState(() {
                          localizationChangeProvider.onLocaleChanged(locale);
                          _localeDropdown = locale;
                        });
                      },
                      items: localizationChangeProvider.supportedLocales().map<DropdownMenuItem<Locale>>((locale) {
                        return DropdownMenuItem<Locale>(
                          child: Text(localizationChangeProvider.namesForLanguageCodes[locale.languageCode]),
                          value: locale
                        );
                      }).toList(),
                    ),
                    padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
