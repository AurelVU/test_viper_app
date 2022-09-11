import 'package:app/viper/error_handler.dart';
import 'package:app/viper/interactor.dart';
import 'package:counter/counter.dart';

class SurpriseInteractor extends Interactor {
  SurpriseInteractor({
    required WinCalculatorUseCase winCalculatorUseCase,
    ErrorHandler? errorHandler,
  })  : _winCalculatorUseCase = winCalculatorUseCase,
        super(errorHandler: errorHandler);

  final WinCalculatorUseCase _winCalculatorUseCase;

  int calculateWinPoints() {
    return _winCalculatorUseCase.calculateWinPoints();
  }
}
