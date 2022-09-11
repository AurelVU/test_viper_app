import 'package:app/internal/di/main_scope.dart';
import 'package:app/presentation/features/surprise/di/surprise_scope.dart';
import 'package:app/presentation/features/surprise/screen/surprise_presenter.dart';
import 'package:app/presentation/features/surprise/screen/surprise_view.dart';
import 'package:app/viper/scope.dart';
import 'package:app/viper/wireframe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
