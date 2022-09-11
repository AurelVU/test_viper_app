import 'package:app/internal/app.dart';
import 'package:app/internal/di/main_scope.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
