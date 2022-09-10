import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';

abstract class Scope {
  final KiwiContainer _container = KiwiContainer.scoped();

  KiwiContainer get container => _container;
}

typedef ScopeFactory<S extends Scope> = S Function(BuildContext);
