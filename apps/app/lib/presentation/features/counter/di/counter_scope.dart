import 'package:app/internal/di/main_scope.dart';
import 'package:app/presentation/features/counter/screen/counter_interactor.dart';
import 'package:app/presentation/features/counter/screen/counter_presenter.dart';
import 'package:app/router/router.dart';
import 'package:app/viper/error_handler.dart';
import 'package:app/viper/scope.dart';
import 'package:counter/counter.dart';

class CounterScope extends Scope {
  CounterScope({required MainScope mainScope}) : _mainInjector = mainScope {
    if (_mainInjector.isProductionMode) {
      _setUpProductionMode();
    } else {
      _setUpDevelopMode();
    }
  }

  final MainScope _mainInjector;

  void _setUpProductionMode() {
    container
      ..registerInstance<CounterService>(
        CounterService(),
      )
      ..registerFactory<ICounterRepository>(
        (container) => CounterRepository(
          container.resolve<CounterService>(),
        ),
      )
      ..registerFactory<CounterUseCase>(
        (container) => CounterUseCase(
          counterRepository: container.resolve<ICounterRepository>(),
        ),
      )
      ..registerInstance<WinCalculatorUseCase>(
        WinCalculatorUseCase(),
      )
      ..registerFactory<CounterInteractor>(
        (container) => CounterInteractor(
          counterUseCase: container.resolve<CounterUseCase>(),
          winCalculatorUseCase: container.resolve<WinCalculatorUseCase>(),
          errorHandler: _mainInjector.container.resolve<ErrorHandler>(),
        ),
      )
      ..registerFactory<CounterPresenter>(
        (container) => CounterPresenter(
          interactor: container.resolve<CounterInteractor>(),
          router: _mainInjector.container.resolve<Router>(),
        ),
      );
  }

  void _setUpDevelopMode() {
    // register something
  }
}
