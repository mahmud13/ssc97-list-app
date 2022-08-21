import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/views/expertise_level/expertise_level_view_model.dart';
import 'package:stacked/stacked.dart';

class ExpertiseLevelView extends StatelessWidget {
  const ExpertiseLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExpertiseLevelViewModel>.reactive(
        viewModelBuilder: () => ExpertiseLevelViewModel(),
        builder: (context, model, widget) => const Text('home'));
  }
}
