import 'package:test_viper_app/data/exception/counter_exception.dart';
import 'package:test_viper_app/data/mapper/counter_mapper.dart';
import 'package:test_viper_app/data/service/counter_service.dart';
import 'package:test_viper_app/domain/entity/counter.dart';

abstract class ICounterRepository {
  Future<Counter> getInitCounter();
}

class CounterRepository extends ICounterRepository {
  CounterRepository(this._service);

  final CounterService _service;

  @override
  Future<Counter> getInitCounter() async {
    try {
      return mapCounter(await _service.getStartCount());
    } catch (error) {
      throw CounterException(message: error.toString());
    }
  }
}
