import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:ponder_sliders/model/aspect_model.dart';

class ListModel extends ChangeNotifier {
  
  final List<Aspect> _aspects = []
    ..add(Aspect('Funktionalität'))
    ..add(Aspect('Effizienz'))
    ..add(Aspect('Sicherheit'))
    ..add(Aspect('Kompatibilität'))
    ..add(Aspect('Verlässlichkeit'))
    ..add(Aspect('Usability'))
    ..add(Aspect('Wartung'))
    ..add(Aspect('Portierbarkeit'));
    
  UnmodifiableListView get items => UnmodifiableListView(_aspects);

  void add(Aspect aspect) {
    _aspects.add(aspect);
    notifyListeners();
  }

  void remove(int index) {
    _aspects.removeAt(index);
    notifyListeners();
  }

  void updateRating(int index, double rating) {
    _aspects[index].rating = rating;
    notifyListeners();
  }
}