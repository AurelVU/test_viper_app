import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';
import 'package:test_viper_app/domain/usecase/win_calculator/win_calculator_interactor.dart';
import 'package:test_viper_app/presentation/features/surprise/surprise_presenter.dart';
import 'package:test_viper_app/viper/custom_presenter.dart';

class CounterPresenter extends CustomPresenter {
  final CounterInteractor counterInteractor;
  final WinCalculatorInteractor winCalculatorInteractor;

  Stream<int?> get incrementState => counterInteractor.counterStream;

  CounterPresenter({
    required this.counterInteractor,
    required this.winCalculatorInteractor,
  });

  @override
  void init() {
    incrementState.listen(_checkIsSurprised);
  }

  @override
  void dispose() {}

  void increment() {
    counterInteractor.increment();
  }

  void decrement() {
    counterInteractor.decrement();
  }

  void _checkIsSurprised(int? num) {
    if (winCalculatorInteractor.checkIsSurprised(num ?? 0)) {
      router.routeTo(Routes.surprise);
    }
  }
}
