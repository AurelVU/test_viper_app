import 'package:test_viper_app/presentation/features/counter/counter.dart';
import 'package:test_viper_app/presentation/features/surprise/surprise.dart';

class Routes {
  static String counter = '/counter';
  static String surprise = '/surprise';
}

final routes = {
  Routes.counter: (_) => const Counter(),
  Routes.surprise: (_) => const Surprise(),
};