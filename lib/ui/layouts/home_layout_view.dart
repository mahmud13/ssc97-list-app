import 'package:flutter/material.dart';
import 'package:ssc_97/ui/layouts/home_layout_view_model.dart';
import 'package:ssc_97/ui/views/intro/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class HomeLayoutView extends StatelessWidget {
  final Widget body;
  final int selectedMenuIndex;
  const HomeLayoutView(
      {required this.body, required this.selectedMenuIndex, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<HomeLayoutViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          drawer: Drawer(
              child: Column(
            children: [
              verticalSpaceLarge,
              ElevatedButton(onPressed: () {
                model.syncGoogle();
              }, child: const Text('Sync with googe'))
            ],
          )),
          appBar: AppBar(title: const Text("97-99 Privilage Card Checker")),
          body: body,
        );
      },
      viewModelBuilder: () => HomeLayoutViewModel(),
    );
  }
}
