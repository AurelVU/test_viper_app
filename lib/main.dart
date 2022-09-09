import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:test_viper_app/data/config_repository_di.dart';
import 'package:test_viper_app/domain/config_domain_di.dart';

import 'router/router.dart' as router;
import 'router/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  KiwiContainer createDI() {
    final container = KiwiContainer();
    configRepositoryDI(container);
    configDomainDI(container);

    return container;
  }

  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    router.Router.init(_navigator);

    return Provider<KiwiContainer>(
      create: (context) => createDI(),
      child: MaterialApp(
        navigatorKey: _navigator,
        routes: routes,
        initialRoute: Routes.counter,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
