import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/views/startup/startup_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/generated/l10n.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) {
        return Container();
      },
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.onModelReady(),
    );
  }
}
