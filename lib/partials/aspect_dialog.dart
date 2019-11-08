import 'package:flutter/material.dart';

class AspectDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _aspectName = '';
    return AlertDialog(
      title: Text("Enter the Aspects Name"),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'e.g. Performance'),
              onChanged: (name) => _aspectName = name,
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Add"),
          onPressed: () => Navigator.of(context).pop(_aspectName),
        )
      ],
    );
  }
}
