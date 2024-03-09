import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/firebase_options.dart';
import 'package:logger/logger.dart';

/// This class is used to initialize the application.
final class ApplicationInitialize {
  /// It's only use for setup business
  const ApplicationInitialize._();

  /// This method is used to initialize the application.
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Safety zone
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
      Logger().e(stack);
    });
  }

  static Future<void> _initialize() async {
    Hive.init;

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };
  }
}
