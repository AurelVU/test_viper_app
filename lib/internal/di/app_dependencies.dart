import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/internal/app.dart';
import 'package:test_viper_app/internal/di/main_scope.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({
    required this.app,
    Key? key,
  }) : super(key: key);

  final App app;

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  @override
  Widget build(BuildContext context) {
    return Provider<MainScope>(
      create: (_) => MainScope(),
      child: widget.app,
    );
  }
}
