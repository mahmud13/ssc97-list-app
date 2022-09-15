import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mgcs_app/models/words/word.dart';
import 'package:mgcs_app/ui/layouts/home_layout_view.dart';
import 'package:mgcs_app/ui/views/practice/answer_widget.dart';
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

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
                if (model.isShowingFeedback)
                  RatingBar.builder(
                    initialRating: model.currentAnswer!.accuracy * 3,
                    ignoreGestures: true,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 3,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                Expanded(
                  child: Center(
                    child: model.isBusy
                        ? const CircularProgressIndicator()
                        : model.words.isEmpty
                            ? const Text('No words found')
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  model.wordDifficulties.isEmpty &&
                                          model.wordCategories.isEmpty
                                      ? const CircularProgressIndicator()
                                      : Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: DropdownButtonFormField(
                                                  value: model.wordDifficulties[
                                                      model
                                                          .wordDifficultyIndex],
                                                  onChanged:
                                                      (WordDifficulty? item) {
                                                    model
                                                        .onSelectedWordDifficulty(
                                                            item);
                                                  },
                                                  items: model.wordDifficulties
                                                      .map<
                                                              DropdownMenuItem<
                                                                  WordDifficulty>>(
                                                          (e) {
                                                    return DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.name),
                                                    );
                                                  }).toList(),
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      isDense: true,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10,
                                                      ),
                                                      label: const Text(
                                                          "Word Difficulty")),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: DropdownButtonFormField(
                                                  value: model.wordCategories[
                                                      model.wordCateroryIndex],
                                                  onChanged:
                                                      (WordCategory? item) {
                                                    model
                                                        .onSelectedWordCategory(
                                                            item);
                                                  },
                                                  items: model.wordCategories
                                                      .map<
                                                              DropdownMenuItem<
                                                                  WordCategory>>(
                                                          (e) {
                                                    return DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.name),
                                                    );
                                                  }).toList(),
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      isDense: true,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10,
                                                      ),
                                                      label: const Text(
                                                          "Word Category")),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
