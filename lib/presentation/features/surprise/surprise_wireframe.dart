import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/internal/di/main_scope.dart';
import 'package:test_viper_app/presentation/features/surprise/di/surprise_scope.dart';
import 'package:test_viper_app/presentation/features/surprise/screen/surprise_presenter.dart';
import 'package:test_viper_app/presentation/features/surprise/screen/surprise_view.dart';
import 'package:test_viper_app/viper/scope.dart';
import 'package:test_viper_app/viper/wireframe.dart';

class SurpriseWireframe extends Wireframe<SurprisePresenter, SurpriseScope> {
  const SurpriseWireframe({
    ScopeFactory<SurpriseScope> scopeFactory = _surpriseScopeFactory,
    Key? key,
  }) : super(
          scopeFactory: scopeFactory,
          view: const SurpriseView(),
          key: key,
        );
}

SurpriseScope _surpriseScopeFactory(BuildContext context) {
  final mainScope = context.read<MainScope>();

  return SurpriseScope(mainScope: mainScope);
}
