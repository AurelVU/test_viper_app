import 'dart:async';

import 'package:app/viper/error_handler.dart';
import 'package:app/viper/interactor.dart';
import 'package:counter/counter.dart';
import 'package:rxdart/subjects.dart';

class CounterInteractor extends Interactor {
  CounterInteractor({
    required CounterUseCase counterUseCase,
    required WinCalculatorUseCase winCalculatorUseCase,
    ErrorHandler? errorHandler,
  })  : _counterUseCase = counterUseCase,
        _winCalculatorUseCase = winCalculatorUseCase,
        super(errorHandler: errorHandler);

  final CounterUseCase _counterUseCase;
  final WinCalculatorUseCase _winCalculatorUseCase;

  final BehaviorSubject<Counter> _counterStream = BehaviorSubject();

  Stream<Counter> get counterStream => _counterStream;

  Counter get counter => _counterStream.value;

  @override
  void init() {
    _loadCounter();
  }

  @override
  void dispose() {
    _counterStream.close();
  }

  void increase() {
    _counterStream.add(counter.copyWith(count: counter.count + 1));
  }

  void decrease() {
    final newCount = counter.count - 1;
    if (newCount < 0) {
      _counterStream.addError(
        CounterException(
          message: 'Значение не может быть отрицательным',
        ),
      );
    } else {
      _counterStream.add(counter.copyWith(count: newCount));
    }
  }

  bool checkIsSurprised() {
    return _winCalculatorUseCase.checkIsSurprised(counter.count);
  }

  void reset() {
    _counterStream.add(counter.copyWith(count: 1));
  }

  Future<void> _loadCounter() async {
    try {
      _counterStream.add(await _counterUseCase.getCounter());
    } on CounterException catch (exception) {
      handleError(exception.message);
      _counterStream.addError(exception);
    }
  }
}