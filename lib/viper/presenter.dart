import 'package:test_viper_app/router/router.dart';
import 'package:test_viper_app/viper/interactor.dart';

abstract class Presenter<I extends Interactor> {
  Presenter({
    required I interactor,
    required Router router,
  })  : _interactor = interactor,
        _router = router;

  final I _interactor;

  final Router _router;

  Router get router => _router;

  I get interactor => _interactor;

  void init() {
   _interactor.init();
  }

  void dispose(){
    _interactor.dispose();
  }
}
