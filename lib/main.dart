import 'package:flutter/material.dart';
import 'package:test_viper_app/internal/app.dart';
import 'package:test_viper_app/internal/di/app_dependencies.dart';

void main() {
  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
