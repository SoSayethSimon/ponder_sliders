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
              RaisedButton(child: Text("+"), color: Colors.indigoAccent, onPressed: () => aspects.add(Aspect("Test")),),
              RaisedButton(child: Text("List"), color: Colors.indigoAccent),
              RaisedButton(child: Text("Templates"), color: Colors.indigoAccent)
            ],
            alignment: MainAxisAlignment.spaceEvenly,
          )
        ],
      ));
  }
}