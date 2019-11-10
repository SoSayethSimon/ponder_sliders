import 'package:flutter/material.dart';
import 'package:ponder_sliders/config/app_localization.dart';
import 'package:ponder_sliders/model/aspect_model.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:ponder_sliders/pages/settings_page.dart';
import 'package:ponder_sliders/partials/aspect_dialog.dart';
import 'package:ponder_sliders/partials/aspect_list.dart';
import 'package:ponder_sliders/partials/list_dialog.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  final String title;

  LandingPage(this.title);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<String> _showAspectNameDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AspectDialog();
        });
  }

  void _showListDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return ListDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    var aspects = Provider.of<ListModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: AspectList(),
              ),
            ),
            ButtonBar(
              children: [
                RaisedButton(
                  child: Text("+"),
                  color: Colors.indigoAccent,
                  onPressed: () async {
                    String _name = await _showAspectNameDialog();
                    if (_name != null) aspects.add(Aspect(_name));
                  },
                ),
                RaisedButton(
                    child: Text(AppLocalization.of(context).text("LIST")),
                    color: Colors.indigoAccent,
                    onPressed: () => _showListDialog()),
                RaisedButton(
                  child: Text(AppLocalization.of(context).text("SETTINGS")),
                  color: Colors.indigoAccent,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage())),
                )
              ],
              alignment: MainAxisAlignment.spaceEvenly,
            )
          ],
        ));
  }
}
