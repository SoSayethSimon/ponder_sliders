import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/config/app_localization.dart';
import 'package:ponder_sliders/config/localization_change_provider.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  int _templateDropdown = 0;
  Locale _localeDropdown;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_localeDropdown == null) _localeDropdown = Localizations.localeOf(context);
    var aspects = Provider.of<ListModel>(context);
    var templateButtons = <DropdownMenuItem<int>>[];
    aspects.reinitializeTemplates(context); // Reinitialize with every rebuild, as locales can change the templates
    aspects.templateNames(context).asMap().forEach((index, templateName) => 
      templateButtons.add(
        DropdownMenuItem<int>(
          child: Text(templateName),
          value: index
        )
      )
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).text("SETTINGS")),
        backgroundColor: Colors.blueGrey,
      ),
      body: Builder(
        builder: (context) => ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Expanded(
                        child: DropdownButton(
                      value: _templateDropdown,
                      items: templateButtons,
                      onChanged: (int newValue) {
                        setState(() {
                          _templateDropdown = newValue;
                        });
                      },
                    ))
                  ]),
                  Row(children: [
                    Expanded(child: RaisedButton(child: Text(AppLocalization.of(context).text("LOAD-TEMPLATE")),
                      onPressed: () => aspects.loadTemplate(_templateDropdown),))
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
                      onSubmitted: (String input) {
                        setState(() {
                          double converted = double.parse(input).abs();
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(AppLocalization.of(context).text("LIMIT-CHANGED") + converted.toString())
                          ));
                        aspects.updateLimit(converted);
                        });
                      },
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
      ),
    );
  }
}
