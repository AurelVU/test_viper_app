import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/internal/di/main_scope.dart';
import 'package:test_viper_app/presentation/features/counter/screen/counter_presenter.dart';
import 'package:test_viper_app/presentation/features/counter/di/counter_scope.dart';
import 'package:test_viper_app/presentation/features/counter/screen/counter_view.dart';
import 'package:test_viper_app/viper/scope.dart';
import 'package:test_viper_app/viper/wireframe.dart';

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
