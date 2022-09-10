import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/presentation/features/surprise/screen/surprise_presenter.dart';

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
                StreamBuilder<int>(
                  stream: presenter.winPointsStream,
                  builder: (context, winState) {
                    if (!winState.hasData) {
                      return const Text('Loading...');
                    }

                    return Text('You won ${winState.data} points!!!');
                  },
                ),
                ElevatedButton(
                  onPressed: presenter.reset,
                  child: const Text('Reset'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
