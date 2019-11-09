import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/config/AppLocalization.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:provider/provider.dart';

class ListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var aspects = Provider.of<ListModel>(context);
    return AlertDialog(
      title: Text(AppLocalization.of(context).text("CURRENT-VALUES")),
      content: new Column(
        children: <Widget>[
          new Expanded(
            child: SelectableText(aspects.toString()),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(AppLocalization.of(context).text("CLOSE")),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
