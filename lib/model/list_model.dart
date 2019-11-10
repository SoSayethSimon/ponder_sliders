import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:ponder_sliders/config/app_localization.dart';
import 'package:ponder_sliders/model/aspect_model.dart';

class ListModel extends ChangeNotifier {

  bool templatesInitialized = false;

  List<List<Aspect>> _templates;
  
  List<Aspect> _aspects;

  List<String> templateNames(BuildContext context) {
    return []
      ..add(AppLocalization.of(context).text("TEMPLATE_1"))
      ..add(AppLocalization.of(context).text("TEMPLATE_2"))
      ;
  }

  List<List<Aspect>> _templateDefiner(BuildContext context) {
    return []
      ..add([]
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_FUNCTIONALITY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_EFFICIENCY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_SECURITY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_COMPATABILITY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_RELIABILITY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_USABILITY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_MAINTAINABILITY")))
        ..add(Aspect(AppLocalization.of(context).text("TEMPLATE_PORTABILITY")))
        )
      ..add([]
        ..add(Aspect("Test"))
      );
  }

  ListModel() {
    this._templates = [];
    this._aspects = [];
  }

  void reinitializeTemplates(BuildContext context) {
    _templates = _templateDefiner(context);
    this.templatesInitialized = true;
  }

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

  void loadTemplate(int templateIndex) {
    _aspects = []..addAll(_templates[templateIndex]);
    notifyListeners();
  }

  @override
  String toString() {
    var output = "";
    items.forEach((item) => output += item.toString() + "\n");
    return output;
  }
}
