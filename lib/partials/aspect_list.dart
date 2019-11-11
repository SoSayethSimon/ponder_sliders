import 'package:flutter/widgets.dart';
import 'package:ponder_sliders/config/app_localization.dart';
import 'package:ponder_sliders/model/list_model.dart';
import 'package:ponder_sliders/partials/aspect_entry.dart';
import 'package:provider/provider.dart';

class AspectList extends StatelessWidget {
  AspectList();

  @override
  Widget build(BuildContext context) {
    var aspects = Provider.of<ListModel>(context);
    return aspects.items.isEmpty ? Text(AppLocalization.of(context).text("EMPTY_LIST")) :  ListView.builder(
        itemCount: aspects.items.length,
        itemBuilder: (context, index) {
          return AspectEntry(index);
        });
  }
}
