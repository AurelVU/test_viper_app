import 'package:kiwi/kiwi.dart';
import 'package:test_viper_app/data/repositories/counter_repository.dart';
import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';
import 'package:test_viper_app/domain/usecase/win_calculator/win_calculator_interactor.dart';

void configDomainDI(KiwiContainer container) {
  container.registerInstance(CounterInteractor(
      counterRepository: container.resolve<CounterRepository>())
    ..init());
  container.registerInstance(WinCalculatorInteractor(
    counterStream: container.resolve<CounterInteractor>().counterStream,
    counterInitValue: container.resolve<CounterInteractor>().counter,
  ));
}
