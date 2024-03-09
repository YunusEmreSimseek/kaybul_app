import 'package:flutter/material.dart';

final class ProjectGeneralTheme {
  const ProjectGeneralTheme._();

  static ThemeData dark() {
    return ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(centerTitle: true));
  }

  static ThemeData light() {
    return ThemeData.light().copyWith();
  }
}
