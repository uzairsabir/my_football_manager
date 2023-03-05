import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Export/MyExport.dart';

class AppPages {
  String defaultRoute = "";

  AppPages({required defaultRoute});

  final homePage = [
    GetPage(
      name: home,
      page: () => DashboardMobile_Main(
        notifyParent: (() => null),
      ),
    ),
  ];
}
