import 'package:flutter/material.dart';
import 'package:mgcs_app/models/words/word.dart';
import 'package:mgcs_app/ui/views/intro/ui_helpers.dart';
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
import 'package:stacked/stacked.dart';

class DropdownWidget extends ViewModelWidget<PracticeViewModel> {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context, PracticeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: DropdownButtonFormField(
              value: viewModel.wordDifficulties[viewModel.wordDifficultyIndex],
              onChanged: (WordDifficulty? item) {
                viewModel.onSelectedWordDifficulty(item);
              },
              items: viewModel.wordDifficulties
                  .map<DropdownMenuItem<WordDifficulty>>((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  label: const Text("Word Difficulty")),
            ),
          ),
          horizontalSpaceMedium,
          Flexible(
            flex: 1,
            child: DropdownButtonFormField(
              value: viewModel.wordCategories[viewModel.wordCateroryIndex],
              onChanged: (WordCategory? item) {
                viewModel.onSelectedWordCategory(item);
              },
              items:
                  viewModel.wordCategories.map<DropdownMenuItem<WordCategory>>((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  label: const Text("Word Category")),
            ),
          ),
        ],
      ),
    );
  }
}
