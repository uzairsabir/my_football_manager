import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyNetwork {
  static final MyNetwork _singleton = MyNetwork._internal();

  factory MyNetwork() {
    return _singleton;
  }

  MyNetwork._internal();

  Future<bool> isConnectedToNetwork(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }

    MyUtils.showSnackBarInfo(
        context, (MyLanguage.of(context)?.translateFromFile("not_internet"))!);

    MyUtils.hideloader();
    // MyUtils.showSnackBar(
    //     context, (MyLanguage.of(context)?.translateFromFile("not_internet"))!);
    return false;
  }
}
