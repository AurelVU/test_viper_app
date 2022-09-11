import '../../../data/repository/counter_repository.dart';
import '../../entity/counter.dart';

class CounterUseCase {
  CounterUseCase({required ICounterRepository counterRepository})
      : _counterRepository = counterRepository;

  final ICounterRepository _counterRepository;

  Future<Counter> getCounter() {
    return _counterRepository.getInitCounter();
  }

  Future<Counter> getCounterAndSetZeroValue() {
    return _counterRepository.getInitCounter().then(
          (value) => value.copyWith(count: 0),
        );
  }
}
