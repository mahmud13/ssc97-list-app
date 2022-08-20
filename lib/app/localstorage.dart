import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getLocalStorage() async =>
    await SharedPreferences.getInstance();
