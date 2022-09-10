import 'dart:math';

class WinCalculatorUseCase {
  final Random _random = Random();

  int calculateWinPoints() => _random.nextInt(10);

  bool checkIsSurprised(int value) => value > 5;
}
