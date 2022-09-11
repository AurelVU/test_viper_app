import 'package:app/internal/app.dart';
import 'package:app/internal/di/app_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
