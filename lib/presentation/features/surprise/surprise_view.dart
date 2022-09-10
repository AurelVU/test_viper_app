import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'surprise_presenter.dart';

class SurpriseView extends StatelessWidget {
  const SurpriseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<SurprisePresenter>();

    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Surprise!!!',
                style: TextStyle(fontSize: 32),
              ),
              StreamBuilder(
                  stream: presenter.winCalculatorInteractor.winStream,
                  initialData: presenter.winCalculatorInteractor.winCount,
                  builder: (context, winState) {
                    if (winState.data == null) {
                      return const Text('Loading...');
                    }

                    return Text('You won ${winState.data} points!!!');
                  }),
              ElevatedButton(
                  onPressed: presenter.reset, child: const Text('Reset'))
            ],
          )),
        ],
      ),
    );
  }
}
