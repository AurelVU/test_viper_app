import 'package:app/internal/di/main_scope.dart';
import 'package:app/presentation/features/surprise/screen/surprise_interactor.dart';
import 'package:app/presentation/features/surprise/screen/surprise_presenter.dart';
import 'package:app/router/router.dart';
import 'package:app/viper/error_handler.dart';
import 'package:app/viper/scope.dart';
import 'package:counter/counter.dart';

class SurpriseScope extends Scope {
  SurpriseScope({
    required MainScope mainScope,
  }) : _mainInjector = mainScope {
    if (_mainInjector.isProductionMode) {
      _setUpProductionMode();
    } else {
      _setUpDevelopMode();
    }
  }

  final MainScope _mainInjector;

  void _setUpProductionMode() {
    container
      ..registerInstance<WinCalculatorUseCase>(
        WinCalculatorUseCase(),
      )
      ..registerFactory<SurpriseInteractor>(
        (container) => SurpriseInteractor(
          winCalculatorUseCase: container.resolve<WinCalculatorUseCase>(),
          errorHandler: _mainInjector.container.resolve<ErrorHandler>(),
        ),
      )
      ..registerFactory<SurprisePresenter>(
        (container) => SurprisePresenter(
          interactor: container.resolve<SurpriseInteractor>(),
          router: _mainInjector.container.resolve<Router>(),
        ),
      );
  }

  void _setUpDevelopMode() {
    // register something
  }
}
