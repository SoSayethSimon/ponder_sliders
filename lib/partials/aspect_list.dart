import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/model/aspect_model.dart';
import 'package:ponder_sliders/partials/aspect_entry.dart';

class AspectList extends StatelessWidget {
  final List<Aspect> aspects;
  AspectList(this.aspects);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: aspects.length,
      itemBuilder: (context, index) {
        return AspectEntry(aspects, index);
      }
    );
  }
}