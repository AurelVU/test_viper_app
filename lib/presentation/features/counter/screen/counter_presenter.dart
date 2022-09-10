import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:test_viper_app/data/exception/counter_exception.dart';
import 'package:test_viper_app/domain/entity/counter.dart';
import 'package:test_viper_app/presentation/features/counter/screen/counter_interactor.dart';
import 'package:test_viper_app/router/router.dart';
import 'package:test_viper_app/router/routes.dart';
import 'package:test_viper_app/viper/presenter.dart';

class CounterPresenter extends Presenter<CounterInteractor> {
  CounterPresenter({
    required CounterInteractor interactor,
    required Router router,
  }) : super(
          interactor: interactor,
          router: router,
        );

  final BehaviorSubject<int> _countStream = BehaviorSubject();
  late final StreamSubscription<Counter> _counterStreamSubscription;

  Stream<int> get countStream => _countStream;

  Stream<Counter> get _counterStream =>
      interactor.counterStream.doOnError(_onCounterError);

  @override
  void init() {
    super.init();

    _counterStreamSubscription = _counterStream.listen((count) {
      _updateCount(count.count);
      _checkIsSurprised();
    });
  }

  @override
  void dispose() {
    _counterStreamSubscription.cancel();
    _countStream.close();

    super.dispose();
  }

  void increase() {
    interactor.increase();
  }

  void decrease() {
    interactor.decrease();
  }

  void _onCounterError(Object error, StackTrace _) {
    if (error is CounterException) {
      router.showErrorSnackBar(error.message);
    }
  }

  void _updateCount(int newCount) {
    _countStream.add(newCount);
  }

  void _checkIsSurprised() {
    if (interactor.checkIsSurprised()) {
      router.clearSnackBars();
      router.routeTo(Routes.surprise);
      interactor.reset();
    }
  }
}
