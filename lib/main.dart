import 'package:flutter/material.dart';
import 'package:flutter_base/constants.dart';
import 'package:flutter_base/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RoutePath.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
