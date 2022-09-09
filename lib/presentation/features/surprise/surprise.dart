import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';

import 'surprise_presenter.dart';
import 'surprise_view.dart';

class Surprise extends StatelessWidget {
  const Surprise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<SurprisePresenter>(
      create: (context) => SurprisePresenter(
          counterInteractor:
              context.read<KiwiContainer>().resolve<CounterInteractor>())
        ..init(),
      dispose: (_, presenter) => presenter.dispose(),
      child: const SurpriseView(),
    );
  }
}
