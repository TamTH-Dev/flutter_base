import 'package:flutter/material.dart';
import 'package:flutter_base/pages/home.dart';

import 'constants.dart';
import 'pages/shrink_top_list.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return HomePage.getPage(settings);
      case RoutePath.shrinkTopList:
        return ShrinkTopListPage.getPage(settings);
    }

    return HomePage.getPage(settings);
  }
}
