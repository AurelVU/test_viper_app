import 'package:test_viper_app/domain/use_case/win_calculator/win_calculator_use_case.dart';
import 'package:test_viper_app/viper/error_handler.dart';
import 'package:test_viper_app/viper/interactor.dart';

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
