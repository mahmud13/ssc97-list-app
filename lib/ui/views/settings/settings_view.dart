import 'package:flutter/material.dart';
import 'package:ssc_97/ui/layouts/home_layout_view.dart';
import 'package:ssc_97/ui/views/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) {
        return HomeLayoutView(
          selectedMenuIndex: 2,
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
                                child: const Text('settings'),
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
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
