import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';
import 'package:test_viper_app/viper/custom_presenter.dart';

class CounterPresenter extends CustomPresenter {
  final CounterInteractor counterInteractor;

  Stream<int?> get incrementState => counterInteractor.counterStream;

  CounterPresenter({required this.counterInteractor});

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
    if (num != null && num > 5) {
      router.routeTo(Routes.surprise);
    }
  }
}
