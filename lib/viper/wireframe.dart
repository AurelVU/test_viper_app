import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/viper/presenter.dart';
import 'package:test_viper_app/viper/scope.dart';

abstract class Wireframe<P extends Presenter, S extends Scope>
    extends StatefulWidget {
  const Wireframe({
    required ScopeFactory<S> scopeFactory,
    required Widget view,
    Key? key,
  })  : _scopeFactory = scopeFactory,
        _view = view,
        super(key: key);

  final ScopeFactory<S> _scopeFactory;
  final Widget _view;

  @override
  State<Wireframe<P, S>> createState() => _WireframeState<P, S>();
}

class _WireframeState<P extends Presenter, S extends Scope>
    extends State<Wireframe<P, S>> {
  late final S _scope;

  @override
  void initState() {
    super.initState();

    _scope = widget._scopeFactory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Provider<P>(
      create: (_) => _scope.container.resolve<P>()..init(),
      dispose: (_, presenter) {
        presenter.dispose();
        _scope.container.clear();
      },
      child: widget._view,
    );
  }
}
