import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SettingsState();

}

class _SettingsState extends State<SettingsPage> {

  String _dropdownValue = "Placeholder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: <Widget>[
                Row(children: [Expanded(child: DropdownButton(
                  value: _dropdownValue,
                  items: [
                    DropdownMenuItem(child: Text("Placeholder"), value: "Placeholder"),
                    DropdownMenuItem(child: Text("Just a test"), value: "1"),
                    DropdownMenuItem(child: Text("Second test"), value: "2"),
                  ],
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                ))]),
                Row(children: [Expanded(child: RaisedButton(child: Text("Load template")))]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Text("Max. Value:"),
                Expanded(
                  child: Padding(
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}