import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearna_test/app/my_app.dart';

import 'core/injection/injection_container.dart' as di;
import 'core/storage/shared/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //! Dependency Injection Box Initialization
  await di.init();
  //! Run App
  //Shared Preferences Initialization
  SharedPreferences.getInstance().then(
    (prefs) {
      AppSharedPreferences.init(prefs);
      runApp(
        const MyApp(),
      );
    },
  );
}
