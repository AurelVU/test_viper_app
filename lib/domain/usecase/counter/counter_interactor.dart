import 'package:rxdart/rxdart.dart';
import 'package:test_viper_app/data/repositories/counter_repository.dart';

class CounterInteractor {
  final CounterRepository counterRepository;

  CounterInteractor({required this.counterRepository});

  late BehaviorSubject<int?> _counter;
  int? get counter => _counter.value;
  Stream<int?> get counterStream => _counter;

  Future<void> init() async {
    _counter =
        BehaviorSubject<int?>.seeded(null);

    counterRepository.getInitCounter().then((value) => _counter.add(value));
  }

  void decrement() {
    _counter.add(counter! - 1);
  }

  void increment() {
    _counter.add(counter! + 1);
  }

  void reset() {
    _counter.add(0);
  }
}
