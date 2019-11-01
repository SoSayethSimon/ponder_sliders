import 'package:flutter/material.dart';
import 'package:ponder_sliders/model/aspect_model.dart';

class AspectEntry extends StatefulWidget {
  final List<Aspect> aspects;
  final int index;

  AspectEntry(this.aspects, this.index);

  @override
  _AspectEntryState createState() => _AspectEntryState(aspects);
}

class _AspectEntryState extends State<AspectEntry> {
  List<Aspect> aspects;

  _AspectEntryState(this.aspects);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (newRating) {
                    setState(() {
                     aspects[widget.index].rating = newRating; 
                    });
                  },
                  value: aspects[widget.index].rating,
                ),
              ),
              Container(
                child: Text("${aspects[widget.index].rating.toInt()}"),
                width: 50.0,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      ],);
  }
}