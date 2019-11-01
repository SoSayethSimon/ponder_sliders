import 'package:flutter/material.dart';
import 'package:ponder_sliders/pages/landing_page.dart';

void main() => runApp(MyApp());

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