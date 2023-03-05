import 'package:get/get_navigation/src/nav2/get_nav_config.dart';
import 'package:get/get_navigation/src/nav2/get_router_delegate.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends GetDelegate {
  String defaultRoute;
  AppRouterDelegate({required this.defaultRoute});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(defaultRoute)!.currentPage!],
    );
  }
}
