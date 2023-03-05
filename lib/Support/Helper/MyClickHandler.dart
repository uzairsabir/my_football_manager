import 'package:my_football_manager/Support/Export/MyExport.dart';
import 'package:get/get.dart';

class MyClickHandler {
  static final MyClickHandler _singleton = MyClickHandler._internal();

  factory MyClickHandler() {
    return _singleton;
  }

  MyClickHandler._internal();

  Open(BuildContext context, Widget widget) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
