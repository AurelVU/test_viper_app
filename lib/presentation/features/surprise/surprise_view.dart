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
              ElevatedButton(
                  onPressed: presenter.reset, child: const Text('Reset'))
            ],
          )),
        ],
      ),
    );
  }
}
