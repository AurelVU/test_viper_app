import 'package:test_viper_app/router/router.dart';
import 'presenter.dart';

export 'package:test_viper_app/router/routes.dart';

abstract class CustomPresenter extends Presenter<Router> {
  @override
  Router get router => Router();
}