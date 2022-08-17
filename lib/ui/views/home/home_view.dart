import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:mgcs_app/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 93, color: theme.primaryColor),
                  ),
                 
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
