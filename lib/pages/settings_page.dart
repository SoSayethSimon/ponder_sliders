import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatelessWidget {

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
                  value: "Placeholder",
                  items: [
                    DropdownMenuItem(child: Text("Placeholder"), value: "Placeholder"),
                    DropdownMenuItem(child: Text("Just a test"), value: "1"),
                    DropdownMenuItem(child: Text("Second test"), value: "2"),
                  ]
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