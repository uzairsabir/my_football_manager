import 'package:my_football_manager/Support/Export/MyExport.dart';
import 'package:flutter/cupertino.dart';

class MyModalAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  String text;
  final Function(String) onChanged;
  final Function(String) onRightChanged;

  MyModalAppBar(
      {required this.text,
      required this.onChanged,
      required this.rightIcon,
      required this.onRightChanged});

  IconData rightIcon;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      automaticallyImplyLeading: true,
      middle: Text(text,
          style: TextStyle(
              fontSize: MyFont.appTitleText,
              fontWeight: MyFont.fontWeightMedium,
              fontFamily: MyFont.fontFamily,
              color: MyColor.getThemeColor())),
      trailing: GestureDetector(
        child: this.rightIcon == Icons.clear
            ? Container(
                height: 0,
                width: 0,
              )
            : new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new IconButton(
                      icon: Icon(
                        this.rightIcon,
                        color: MyColor.getThemeColor(),
                      ),
                      onPressed: () {
                        onRightChanged("");
                      }),
                ],
              ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
