import 'package:test_viper_app/data/repository/counter_repository.dart';
import 'package:test_viper_app/data/service/counter_service.dart';
import 'package:test_viper_app/domain/use_case/counter/counter_use_case.dart';
import 'package:test_viper_app/domain/use_case/win_calculator/win_calculator_use_case.dart';
import 'package:test_viper_app/internal/di/main_scope.dart';
import 'package:test_viper_app/presentation/features/counter/screen/counter_interactor.dart';
import 'package:test_viper_app/presentation/features/counter/screen/counter_presenter.dart';
import 'package:test_viper_app/router/router.dart';
import 'package:test_viper_app/viper/error_handler.dart';
import 'package:test_viper_app/viper/scope.dart';

class CounterScope extends Scope{
  CounterScope({required MainScope mainScope})
      : _mainInjector = mainScope {
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
