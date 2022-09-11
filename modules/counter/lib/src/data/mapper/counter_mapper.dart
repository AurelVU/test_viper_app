import 'package:counter/src/data/model/counter_dto.dart';
import 'package:counter/src/domain/entity/counter.dart';

Counter mapCounter(CounterDto counterDto) {
  return Counter(count: counterDto.count);
}
