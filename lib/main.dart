import 'package:flutter/material.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:ponder_sliders/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(
      builder: (context) => ListModel(),
      child: MyApp()
    )
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ponder Sliders',
      theme: ThemeData.light(),
      home: LandingPage('Ponder Sliders'),
    );
  }
}