import 'package:flutter/material.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:provider/provider.dart';

class AspectEntry extends StatefulWidget {
  final int index;

  AspectEntry(this.index);

  @override
  _AspectEntryState createState() => _AspectEntryState();
}

class _AspectEntryState extends State<AspectEntry> {
  _AspectEntryState();

  @override
  Widget build(BuildContext context) {
    var aspects = Provider.of<ListModel>(context);
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("${aspects.items[widget.index].name}"),
                    FlatButton(
                      child: Text("X"),
                      onPressed: () => aspects.remove(widget.index),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Slider(
                        activeColor: Colors.indigoAccent,
                        min: 0.0,
                        max: 10.0,
                        onChanged: (newRating) {
                          setState(() {
                            aspects.updateRating(widget.index, newRating);
                          });
                        },
                        value: aspects.items[widget.index].rating,
                      ),
                    ),
                    Container(
                      child:
                          Text("${aspects.items[widget.index].rating.toInt()}"),
                      width: 50.0,
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
