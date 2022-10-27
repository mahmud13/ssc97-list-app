import 'package:flutter/material.dart';
import 'package:ssc_97/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

/// The type of snackbar to show
enum SnackbarType { success, error }

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      titleColor: Colors.white,
      messageColor: Colors.white,
      borderRadius: 1,
    ),
  );
}