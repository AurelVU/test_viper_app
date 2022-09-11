import 'package:app/presentation/features/counter/counter_wireframe.dart';
import 'package:app/presentation/features/surprise/surprise_wireframe.dart';

class Routes {
  static String counter = '/counter';
  static String surprise = '/surprise';
}

final routes = {
  Routes.counter: (_) => const CounterWireframe(),
  Routes.surprise: (_) => const SurpriseWireframe(),
};
