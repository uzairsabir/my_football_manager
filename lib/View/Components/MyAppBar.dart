import 'package:my_football_manager/Support/Export/MyExport.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onRightChanged;

  MyAppBar(
      {this.pageInstanceFunction,
      required this.pageTitle,
      required this.rightIcon,
      required this.notificationCounter,
      required this.isBackButton,
      required this.onRightChanged});

  var pageInstanceFunction;
  var pageTitle;
  var notificationCounter = 0;
  var isBackButton = false;
  IconData rightIcon;

  @override
  Widget build(BuildContext context) {
    // return new Row(children: [
    //
    // ],)

    return new AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MyColor.getThemeColor(),
      // foregroundColor: MyColor.getThemeColor(),
      elevation: 0,
      title: Text(
        pageTitle,
        style: TextStyle(
            fontSize: MyFont.appTitleText,
            fontWeight: MyFont.fontWeightMedium,
            fontFamily: MyFont.fontFamily,
            color: MyColor.getBackground()),
      ),
      centerTitle: true,

      leading: this.isBackButton
          ? new IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: MyColor.getBackground(),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
          : new Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 16.0,
                backgroundImage:
                    NetworkImage('https://googleflutter.com/sample_image.jpg'),
              ),
            ),

      actions: <Widget>[
        this.rightIcon == Icons.notifications_sharp
            ? new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new IconButton(
                      icon: Icon(
                        this.rightIcon,
                        color: MyColor.getBackground(),
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
                                  color: MyColor.getBackground(),
                                  fontSize: MyFont.smallTextSize,
                                  fontFamily: MyFont.fontFamily,
                                  fontWeight: MyFont.fontWeightRegular),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : new Container()
                ],
              )
            : this.rightIcon == Icons.clear
                ? Container()
                : new IconButton(
                    icon: Icon(
                      this.rightIcon,
                      color: MyColor.getBackground(),
                    ),
                    onPressed: () {
                      onRightChanged("");
                    }),
        // Using Stack to show Notification Badge
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
