import 'package:flutter/material.dart';
import 'package:ponder_sliders/config/app_localization.dart';

class AspectDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _aspectName = '';
    return AlertDialog(
      title: Text(AppLocalization.of(context).text("ENTER-NAME")),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: AppLocalization.of(context).text("HINT-ADD")),
              onChanged: (name) => _aspectName = name,
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(AppLocalization.of(context).text("ADD")),
          onPressed: () => Navigator.of(context).pop(_aspectName),
        )
      ],
    );
  }
}
