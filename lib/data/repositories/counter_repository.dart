import '../services/counter_service.dart';

abstract class CounterRepository {
  Future<int> getInitCounter();
}

class CounterRepositoryImpl extends CounterRepository {
  CounterService service = CounterService();

  @override
  Future<int> getInitCounter() async {
    return service.getStartCount();
  }
}
