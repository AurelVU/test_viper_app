import 'package:test_viper_app/router/router.dart';
import 'package:test_viper_app/util/default_error_handler.dart';
import 'package:test_viper_app/viper/error_handler.dart';
import 'package:test_viper_app/viper/scope.dart';

class MainScope extends Scope {
  MainScope({bool isProductionMode = true})
      : _isProductionMode = isProductionMode {
    if (_isProductionMode) {
      _setUpProductionMode();
    } else {
      _setUpDevelopMode();
    }
  }

  final bool _isProductionMode;

  bool get isProductionMode => _isProductionMode;

  void _setUpProductionMode() {
    container
      ..registerSingleton<Router>(
        (_) => Router(),
      )
      ..registerSingleton<ErrorHandler>(
        (_) => DefaultErrorHandler(),
      );
  }

  void _setUpDevelopMode() {
    // register something
  }
}
