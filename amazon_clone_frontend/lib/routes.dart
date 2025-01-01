import 'package:amazon_clone_frontend/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_frontend/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_frontend/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_frontend/features/home_screen/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.screenName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => const AuthScreen(),
      );

    case HomeScreen.screenName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const HomeScreen());

    case BottomBar.screenName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const BottomBar());

    case AddProductScreen.screenName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const AddProductScreen());
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => const Scaffold(
            body: Center(
          child: Text("Screen doesn't Exist"),
        )),
      );
  }
}
