import 'package:app/presentation/features/surprise/screen/surprise_interactor.dart';
import 'package:app/router/router.dart';
import 'package:app/viper/presenter.dart';
import 'package:relation/relation.dart';

class SurprisePresenter extends Presenter<SurpriseInteractor> {
  SurprisePresenter({
    required SurpriseInteractor interactor,
    required Router router,
  }) : super(
          interactor: interactor,
          router: router,
        );

  final EntityStreamedState<int> _winPointsState = EntityStreamedState<int>();

  EntityStreamedState<int> get winPointsState => _winPointsState;

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

    _winPointsState.content(points);
  }
}
