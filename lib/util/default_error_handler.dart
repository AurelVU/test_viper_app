import 'package:test_viper_app/viper/error_handler.dart';

class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error) {
    print(error);
  }
}
