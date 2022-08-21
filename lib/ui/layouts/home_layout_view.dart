import 'package:flutter/material.dart';
import 'package:mgcs_app/ui/layouts/home_layout_view_model.dart';
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
          body: body,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedMenuIndex,
            onTap: model.onTap,
            fixedColor: theme.primaryColor,
            unselectedItemColor: Colors.grey.shade700,
            showUnselectedLabels: true,
            backgroundColor: Colors.grey.shade300,
            iconSize: 50,
            selectedFontSize: 20,
            unselectedFontSize: 20,
            elevation: 30,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/practice.png')),
                label: 'Practice',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/track.png')),
                label: 'Track',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/settings.png')),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/profile.png')),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () =>
          HomeLayoutViewModel(),
    );
  }
}
