import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/layouts/home_layout_view.dart';
import 'package:mgcs_app/ui/views/practice_view/practice_view_model.dart';
import 'package:stacked/stacked.dart';

class PracticeView extends StatelessWidget {
  const PracticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PracticeViewModel>.reactive(
      builder: (context, model, child) {
        return HomeLayoutView(
          selectedMenuIndex: 0,
          body: SafeArea(
            child: Center(
              child: model.isBusy
                  ? const CircularProgressIndicator()
                  : model.user == null
                      ? const Text('A disaster happended')
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hello, ${model.user!.name}",
                                  ),
                                  ElevatedButton(
                                    onPressed: () => null,
                                    child: const Text('Get Started'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        );
      },
      viewModelBuilder: () => PracticeViewModel(),
    );
  }
}
