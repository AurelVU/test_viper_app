import 'package:app/internal/di/main_scope.dart';
import 'package:app/router/router.dart';
import 'package:app/router/routes.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final injector = context.read<MainScope>();
    final router = injector.container.resolve<Router>();

    return MaterialApp(
      navigatorKey: router.navigator,
      scaffoldMessengerKey: router.scaffoldMessenger,
      routes: routes,
      initialRoute: Routes.counter,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
