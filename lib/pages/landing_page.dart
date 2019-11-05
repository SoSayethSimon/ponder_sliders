import 'package:flutter/material.dart';
import 'package:ponder_sliders/model/aspect_model.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:ponder_sliders/partials/aspect_list.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  final String title;

  LandingPage(this.title);

  @override
  _LandingPageState createState() => _LandingPageState(); 
}

class _LandingPageState extends State<LandingPage> {

  Future<String> _showAspectNameDialog() async {
    String _aspectName = '';
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter the Aspects Name"),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'e.g. Performance'
                  ),
                  onChanged: (name) => _aspectName = name,
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(child: Text("Add"), onPressed: () => Navigator.of(context).pop(_aspectName),)
          ],
        );
      }
    );
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
          Expanded(child: Center(child: AspectList(),),),
          ButtonBar(
            children: [
              RaisedButton(child: Text("+"), color: Colors.indigoAccent, onPressed: () async {
                String _name = await _showAspectNameDialog();
                aspects.add(Aspect(_name));
              },),
              RaisedButton(child: Text("List"), color: Colors.indigoAccent),
              RaisedButton(child: Text("Settings"), color: Colors.indigoAccent)
            ],
            alignment: MainAxisAlignment.spaceEvenly,
          )
        ],
      ));
  }
}