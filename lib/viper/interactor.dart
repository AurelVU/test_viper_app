import 'package:test_viper_app/viper/error_handler.dart';

abstract class Interactor {
  Interactor({ErrorHandler? errorHandler}) : _errorHandler = errorHandler;

  final ErrorHandler? _errorHandler;

  void handleError(Object error) {
    _errorHandler?.handleError(error);
  }

  void init() {}

  void dispose() {}
}
