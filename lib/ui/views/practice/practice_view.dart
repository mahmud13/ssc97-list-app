import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mgcs_app/config.dart' as config;
import 'package:mgcs_app/ui/layouts/home_layout_view.dart';
import 'package:mgcs_app/ui/views/practice/practice_view_model.dart';
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
                  : model.words.isEmpty
                      ? const Text('No words found')
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(model.currentWord!.word),
                                  Text(model.currentWord!.transliteration),
                                  CachedNetworkImage(
                                    imageUrl:
                                        "${config.apiUrl}/files?path=${model.currentWord!.picture}",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: ((context, url, error) =>
                                        const Text('No Image')),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => null,
                                    child: const Text('Practice Screen'),
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
