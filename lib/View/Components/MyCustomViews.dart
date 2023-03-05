import 'dart:ui';
import 'package:my_football_manager/Support/Export/MyExport.dart';
import 'package:flutter/cupertino.dart';

class MyCustomViews {
  static final MyCustomViews _singleton = MyCustomViews._internal();

  factory MyCustomViews() {
    return _singleton;
  }

  MyCustomViews._internal();

  Widget getSvgFromAsset(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(margin: EdgeInsets.only(top: 20), child: Container());
  }
}
