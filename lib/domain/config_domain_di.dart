import 'package:kiwi/kiwi.dart';
import 'package:test_viper_app/data/repositories/counter_repository.dart';
import 'package:test_viper_app/domain/usecase/counter/counter_interactor.dart';

void configDomainDI(KiwiContainer container) {
  container.registerInstance(CounterInteractor(
      counterRepository: container.resolve<CounterRepository>())
    ..init());
}
