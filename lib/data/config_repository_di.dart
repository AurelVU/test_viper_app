import 'package:kiwi/kiwi.dart';
import 'package:test_viper_app/data/repositories/counter_repository.dart';

void configRepositoryDI(KiwiContainer container) {
  container.registerSingleton<CounterRepository>((container) => CounterRepositoryImpl());
}