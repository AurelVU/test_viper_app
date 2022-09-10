import 'package:test_viper_app/data/model/counter_dto.dart';

class CounterService {
  Future<CounterDto> getStartCount() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => CounterDto(),
    );
  }
}
