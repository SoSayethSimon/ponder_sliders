import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:ponder_sliders/partials/aspect_entry.dart';
import 'package:provider/provider.dart';

class AspectList extends StatelessWidget {
  AspectList();

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    var aspects = Provider.of<ListModel>(context);
    return ListView.builder(
        itemCount: aspects.items.length,
        itemBuilder: (context, index) {
          return AspectEntry(index);
        });
  }
}
