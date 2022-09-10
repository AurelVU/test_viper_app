import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';
import 'package:test_viper_app/domain/usecase/win_calculator/win_calculator_interactor.dart';

import 'counter_presenter.dart';
import 'counter_view.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<CounterPresenter>(
      create: (context) => CounterPresenter(
        counterInteractor:
            context.read<KiwiContainer>().resolve<CounterInteractor>(),
        winCalculatorInteractor:
            context.read<KiwiContainer>().resolve<WinCalculatorInteractor>(),
      )..init(),
      dispose: (_, presenter) => presenter.dispose(),
      child: const CounterView(),
    );
  }
}
