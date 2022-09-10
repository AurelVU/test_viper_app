import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';
import 'package:test_viper_app/domain/usecase/win_calculator/win_calculator_interactor.dart';
import 'package:test_viper_app/viper/custom_presenter.dart';

class SurprisePresenter extends CustomPresenter {
  final CounterInteractor counterInteractor;
  final WinCalculatorInteractor winCalculatorInteractor;

  Stream<int?> get incrementState => counterInteractor.counterStream;

  SurprisePresenter({
    required this.counterInteractor,
    required this.winCalculatorInteractor,
  });

  @override
  void init() {}

  @override
  void dispose() {}

  void reset() {
    counterInteractor.reset();
    router.routeBack();
  }
}
