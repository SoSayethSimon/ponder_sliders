import 'package:flutter/material.dart';
import 'package:ponder_sliders/model/aspect_model.dart';
import 'package:ponder_sliders/partials/aspect_list.dart';

class LandingPage extends StatefulWidget {
  final String title;

  LandingPage(this.title);

  @override
  _LandingPageState createState() => _LandingPageState(); 
}

class _LandingPageState extends State<LandingPage> {

  List<Aspect> initialAspects = []
    ..add(Aspect('Funktionalität'))
    ..add(Aspect('Effizienz'))
    ..add(Aspect('Sicherheit'))
    ..add(Aspect('Kompatibilität'))
    ..add(Aspect('Verlässlichkeit'))
    ..add(Aspect('Usability'))
    ..add(Aspect('Wartung'))
    ..add(Aspect('Portierbarkeit'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(child: Center(child: AspectList(initialAspects),),),
          ButtonBar(
            children: [
              RaisedButton(child: Text("+"), color: Colors.indigoAccent,),
              RaisedButton(child: Text("List"), color: Colors.indigoAccent),
              RaisedButton(child: Text("Templates"), color: Colors.indigoAccent)
            ],
            alignment: MainAxisAlignment.spaceEvenly,
          )
        ],
      ));
  }
}