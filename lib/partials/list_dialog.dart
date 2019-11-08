import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:provider/provider.dart';

class ListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var aspects = Provider.of<ListModel>(context);
    return AlertDialog(
      title: Text("Your current values"),
      content: new Column(
        children: <Widget>[
          new Expanded(
            child: SelectableText(aspects.toString()),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
