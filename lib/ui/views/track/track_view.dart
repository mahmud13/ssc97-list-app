import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/layouts/home_layout_view.dart';
import 'package:mgcs_app/ui/views/track/track_view_model.dart';
import 'package:stacked/stacked.dart';

class TrackView extends StatelessWidget {
  const TrackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrackViewModel>.reactive(
      builder: (context, model, child) {
        return HomeLayoutView(
          selectedMenuIndex: 1,
          body: SafeArea(
            child: Center(
              child: model.user == null
                  ? const CircularProgressIndicator()
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
                                child: const Text('Track'),
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
      viewModelBuilder: () => TrackViewModel(),
    );
  }
}
