import 'dart:async';

import 'package:test_viper_app/presentation/features/surprise/screen/surprise_interactor.dart';
import 'package:test_viper_app/router/router.dart';
import 'package:test_viper_app/viper/presenter.dart';

class SurprisePresenter extends Presenter<SurpriseInteractor> {
  SurprisePresenter({
    required SurpriseInteractor interactor,
    required Router router,
  }) : super(
    interactor: interactor,
    router: router,
  );

  final StreamController<int> _winPointsStreamController = StreamController();

  Stream<int> get winPointsStream => _winPointsStreamController.stream;

  @override
  void init() {
    super.init();

    _calculateWinPoints();
  }

  void reset() {
    router.routeBack();
  }

  void _calculateWinPoints() {
    final points = interactor.calculateWinPoints();

    _winPointsStreamController.add(points);
  }
}
