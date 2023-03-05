import 'package:my_football_manager/Support/Export/MyExport.dart';

// ignore: must_be_immutable
class MyAppBarDashBoard extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onRightChanged;

  MyAppBarDashBoard(
      {this.pageInstanceFunction,
      required this.pageTitle,
      required this.rightIcon,
      required this.notificationCounter,
      required this.isBackButton,
      required this.onRightChanged});

  var pageInstanceFunction;
  var pageTitle;
  var notificationCounter = 0;

  var list_items = ['Help'];
  var isBackButton = false;
  IconData rightIcon;

  @override
  Widget build(BuildContext context) {
    // return new Row(children: [
    //
    // ],)

    return new AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MyColor.background,
      // foregroundColor: MyColor.getThemeColor(),
      elevation: 3,
      title: Text(
        pageTitle,
        style: TextStyle(
            fontSize: MyFont.appTitleText,
            fontWeight: MyFont.fontWeightMedium,
            fontFamily: MyFont.fontFamily,
            color: MyColor.getAppText()),
      ),
      centerTitle: true,

      leading: this.isBackButton
          ? new IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: MyColor.getAppText(),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
          : new Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/icons/Decibel Icon.png')),

      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 7, bottom: 7),
          padding: EdgeInsets.only(bottom: 7, top: 7),
          height: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColor.getBackground()),
          width: MediaQuery.of(context).size.width / 5,
          child: TextField(
            cursorColor: MyColor.getThemeColor(),
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                focusColor: Colors.green,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  backgroundColor: MyColor.getBackground(),
                  fontSize: 15,
                ),
                hintText: "Search or type a command (Ctrl +G) "),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new IconButton(
                  splashRadius: 15,
                  icon: Icon(
                    this.rightIcon,
                    color: MyColor.getAppText(),
                  ),
                  onPressed: () {}),
              notificationCounter != 0
                  ? new Positioned(
                      right: 11,
                      top: 15,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$notificationCounter',
                          style: TextStyle(
                              color: MyColor.getAppText(),
                              fontSize: MyFont.smallTextSize,
                              fontFamily: MyFont.fontFamily,
                              fontWeight: MyFont.fontWeightRegular),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : new Container(),
            ],
          ),
        ),
        VerticalDivider(
          indent: 15,
          endIndent: 15,
          thickness: .5,
          color: MyColor.getAppText(),
          width: 15,
        ),
        DropdownButton<String>(
          hint: Text("Help"),
          alignment: AlignmentDirectional.center,
          focusColor: Colors.transparent,
          style: TextStyle(fontSize: 15),
          dropdownColor: Colors.white,
          underline: Container(),
          value: 'Help',
          elevation: 6,
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: false,
          items: <String>['Help', 'About Us', 'Contact', 'Docs'].map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {},
        ),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
            child: Icon(
          Icons.abc_outlined,
          size: 15,
        )),
        SizedBox(
          width: 10,
        )

        // Using Stack to show Notification Badge
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
