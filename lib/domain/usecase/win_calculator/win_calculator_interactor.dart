import 'dart:math';

import 'package:rxdart/rxdart.dart';

class WinCalculatorInteractor {
  late BehaviorSubject<int?> _counter;

  late BehaviorSubject<int?> _win;
  late Stream<int?> winStream = _win.stream;
  late int? winCount = _win.value;

  final _random = Random();

  WinCalculatorInteractor({required Stream<int?> counterStream, int? counterInitValue}) {
    _counter = BehaviorSubject<int?>.seeded(counterInitValue);
    counterStream.listen((counter) {
      _counter.add(counter);
      _recalculateWin(counter ?? 0);
    });

    _win = BehaviorSubject<int?>.seeded(null);
  }

  void _recalculateWin(int winCount) {
    if (winCount > 0) {
      _win.add(_random.nextInt(winCount));
    }
  }

  bool checkIsSurprised(int value) => value > 5;
}