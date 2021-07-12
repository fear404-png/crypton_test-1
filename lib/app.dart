import 'package:crypton_test/pages/login_widget/login_widget.dart';
import 'package:crypton_test/pages/main_screen_widget/main_screen_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter app",
      theme: ThemeData(),
      routes: {
        "/login": (context) => LoginWidget(),
        "/main_screen": (context) => MainScreenWidget(),//второй экран
      },
      initialRoute: "/login",
    );
  }
}
