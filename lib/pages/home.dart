import 'package:flutter/material.dart';
import 'package:flutter_base/constants.dart';

import '../models/page.dart';

final pages = [
  const AppPage(name: 'Shrink Top List', route: RoutePath.shrinkTopList),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final item = pages[index];

            return TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(item.route);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple.shade500),
              ),
              child: Text(
                item.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Route<dynamic>? getPage(RouteSettings settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomePage(),
      );
}
