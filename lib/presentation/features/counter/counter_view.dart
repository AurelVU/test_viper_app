import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/presentation/features/counter/counter_presenter.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<CounterPresenter>();

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: StreamBuilder<int?>(
              stream: presenter.incrementState,
              builder: (context, incrementState) => Text(
                incrementState.data?.toString() ?? 'Loading...',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 25,
              right: 1,
              child: SizedBox(
                height: 105,
                width: 100,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: presenter.increment,
                      child: const Text('+'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: presenter.decrement,
                      child: const Text('-'),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
