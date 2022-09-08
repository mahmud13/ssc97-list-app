import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mgcs_app/config.dart' as config;
import 'package:mgcs_app/ui/layouts/home_layout_view.dart';
import 'package:mgcs_app/ui/views/answer/answer_view_model.dart';
import 'package:stacked/stacked.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnswerViewModel>.reactive(
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
                                  Text(
                                    model.currentWord!.word,
                                    style: const TextStyle(fontSize: 40),
                                  ),
                                  Text(model.currentWord!.transliteration),
                                  CachedNetworkImage(
                                    imageUrl:
                                        "${config.apiUrl}/files?path=${model.currentWord!.picture}",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: ((context, url, error) =>
                                        const Text('No Image')),
                                  ),
                                  Listener(
                                    onPointerMove: (e) => model.stopRecording(),
                                    child: LongPressDraggable(
                                      axis: Axis.horizontal,
                                      feedback: FloatingActionButton(
                                        onPressed: () {},
                                        child: const Icon(
                                          Icons.keyboard_voice_outlined,
                                        ),
                                      ),
                                      childWhenDragging:
                                          const Text('recording'),
                                      onDragStarted: model.startRecording,
                                      onDragEnd: (details) =>
                                          model.stopRecording(),
                                      child: IconButton(
                                        onPressed: model.checkPermission,
                                        icon: const Icon(
                                          Icons.keyboard_voice_outlined,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: model.play,
                                      child: const Text('play'))
                                ],
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        );
      },
      viewModelBuilder: () => AnswerViewModel(),
    );
  }
}
