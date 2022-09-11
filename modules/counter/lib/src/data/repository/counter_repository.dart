import 'package:counter/src/data/exception/counter_exception.dart';
import 'package:counter/src/data/mapper/counter_mapper.dart';
import 'package:counter/src/data/service/counter_service.dart';
import 'package:counter/src/domain/entity/counter.dart';

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
