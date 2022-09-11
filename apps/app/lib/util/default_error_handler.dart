import 'package:app/viper/error_handler.dart';

class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error) {
    print(error);
  }
}
