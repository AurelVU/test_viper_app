import 'package:app/internal/di/main_scope.dart';
import 'package:app/presentation/features/counter/di/counter_scope.dart';
import 'package:app/presentation/features/counter/screen/counter_presenter.dart';
import 'package:app/presentation/features/counter/screen/counter_view.dart';
import 'package:app/viper/scope.dart';
import 'package:app/viper/wireframe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterWireframe extends Wireframe<CounterPresenter, CounterScope> {
  const CounterWireframe({
    ScopeFactory<CounterScope> scopeFactory = _counterScopeFactory,
    Key? key,
  }) : super(
          scopeFactory: scopeFactory,
          view: const CounterView(),
          key: key,
        );
}

CounterScope _counterScopeFactory(BuildContext context) {
  final mainScope = context.read<MainScope>();

  return CounterScope(mainScope: mainScope);
}
