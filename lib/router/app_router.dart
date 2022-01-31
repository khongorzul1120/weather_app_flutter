import 'package:flutter/material.dart';
import 'package:green_fintech/pages/bloc/index.dart';
import 'package:green_fintech/pages/detail_page.dart';
import 'package:green_fintech/pages/provider/index.dart';
import 'routes.dart';

class AppRoutes {
  /// Add entry for new route here
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case Routes.APP:
      //   return MaterialPageRoute(
      //       settings: RouteSettings(arguments: args, name: Routes.APP),
      //       builder: (_) {
      //         return MyApp();
      //       });
      case Routes.BLOC:
        return MaterialPageRoute(
            settings: RouteSettings(arguments: args, name: Routes.BLOC),
            builder: (_) {
              // final homePageArgs = args as HomePageArgs;
              return BlocCustomPage();
            });
      case Routes.PROVIDER:
        return MaterialPageRoute(
            settings: RouteSettings(name: Routes.PROVIDER),
            builder: (context) {
              return ProviderCustomPage();
            });
case Routes.DetailPage:
        return MaterialPageRoute(
            settings: RouteSettings(arguments: args,name: Routes.PROVIDER),
            builder: (context) {
              return DetailPage();
            });
       
      // Default case, should not reach here.
      default:
        return null;
    }
  }
}
