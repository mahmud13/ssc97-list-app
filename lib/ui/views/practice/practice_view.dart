import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/layouts/home_layout_view.dart';
import 'package:mgcs_app/ui/views/practice/answer_widget.dart';
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

import 'dropdown_widget.dart';
import 'feedback_widget.dart';

class PracticeView extends StatelessWidget {
  const PracticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PracticeViewModel>.reactive(
      builder: (context, model, child) {
        return HomeLayoutView(
          selectedMenuIndex: 0,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: model.isBusy
                        ? const CircularProgressIndicator()
                        : model.words.isEmpty
                            ? const Text('No words found')
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (!model.isShowingFeedback)
                                    const DropdownWidget(),
                                  Expanded(
                                    child: model.isShowingFeedback
                                        ? const FeedbackWidget()
                                        : const AnswerWidget(),
                                  ),
                                ],
                              ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => PracticeViewModel(),
    );
  }
}
