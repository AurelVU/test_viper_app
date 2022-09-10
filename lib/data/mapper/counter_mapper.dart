import 'package:test_viper_app/data/model/counter_dto.dart';
import 'package:test_viper_app/domain/entity/counter.dart';

Counter mapCounter(CounterDto counterDto) {
  return Counter(count: counterDto.count);
}