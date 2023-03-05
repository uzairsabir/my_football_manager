import 'package:my_football_manager/Support/Export/MyExport.dart';

class DashboardMobileHome_Main extends StatefulWidget
    implements ScreenLoadView {
  final Function() notifyParent;
  String title;
  double menuID;
  String parentMenuID;
  BuildContext context;

  DashboardMobileHome_Main(
      {required this.context,
      required this.notifyParent,
      required this.title,
      required this.menuID,
      required this.parentMenuID}) {
    loadView("");
  }

  @override
  Future loadView(String argument) async {
    // TODO: implement loadView

    //await MyListGridVM(parentMenuID: "${menuID}").insertHome(context);
  }

  @override
  DashboardHomeMobile createState() => DashboardHomeMobile(
      notifyParent: notifyParent,
      title: title,
      menuID: menuID,
      parentMenuID: parentMenuID);
}

class DashboardHomeMobile extends State<DashboardMobileHome_Main>
    implements ScreenItem1, Structure {
  final Function() notifyParent;

  DashboardHomeMobile(
      {required this.notifyParent,
      required this.title,
      required this.menuID,
      required this.parentMenuID}) {}

  String title;
  double menuID;
  String parentMenuID;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(Controller());
    //refresh();
    //argumentsVM = ScreenArgumentsVM.getItem(menuID);

    // MyUtils.printMe("menu_id_1_${Menu.home.index}.0");
    // MyUtils.printMe("menu_id_2_${Menu.home.index.toDouble()}");
    //MyUtils.printMe("menu_id_3_${menuID}");

    // MyUtils.printMe("calling_1");

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: MyAppBar(
              pageTitle: title,
              rightIcon: Icons.clear,
              isBackButton: false,
              notificationCounter: 0,
              onRightChanged: (String value) {},
            ),
            body: Container(
              //color: MyColor.background,
              child: Column(children: [
                Container(
                    color: MyColor.getThemeColor(),
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                          text: MyListGridVM(parentMenuID: "${menuID}")
                              .getMainTitle(context),
                          //text: "",
                          maxLine: 2,
                          fontWeight: MyFont.fontWeightLight,
                          color: MyColor.background,
                          fontSize: MyFont.appTitleText,
                          marginFromLeft: 20,
                          marginFromTop: 0,
                          width: 0,
                          textAlign: TextAlign.left),
                    )),
                MyGridView(
                  container: getItem1,
                  parentMenuID: "${menuID}",
                  columnRatio: 3,
                  notifyParent: refresh,
                  onChanged: (String value) {
                    MyUtils.printMe("is_clicking_me_${value}");
                    MyClickHandler().Open(
                        context,
                        TeamsList_Main(
                            context: context,
                            notifyParent: refresh,
                            title: MyListGridVM(parentMenuID: "${menuID}")
                                    .getItem(false, "")
                                    .elementAt(int.parse(value))
                                    .item2 ??
                                "",
                            menuID: Menu.favourite.index.toDouble(),
                            parentMenuID: parentMenuID));
                  },
                ),
              ]),
            )));
  }

  @override
  Widget getItem1(int index, String parentMenuID, MyListGridVM item) {
    // TODO: implement getItem1

    return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        height: 180,
        decoration: BoxDecoration(
            color: MyColor.getThemeLight(),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) //                 <--- border radius here
                ),
            border: Border.all(width: 0.5, color: MyColor.getThemeColor())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyImageView(
                imageUrl: item.item5 ?? "",
                width: 70,
                height: 70,
                padding: 0,
                onChanged: (String value) {
                  MyClickHandler().Open(
                      context,
                      TeamsList_Main(
                          context: context,
                          notifyParent: refresh,
                          title: MyListGridVM(parentMenuID: "${menuID}")
                                  .getItem(false, "")
                                  .elementAt(int.parse(value))
                                  .item2 ??
                              "",
                          menuID: Menu.favourite.index.toDouble(),
                          parentMenuID: parentMenuID));
                }),

            // MyProfileImage(
            //   radius: 30,
            //   imageurl: item.item5 ?? "",
            //   onChanged: (String value) {},
            // ),
            MyText(
                text: item.item2 ?? "",
                maxLine: 1,
                fontSize: MyFont.normalTextSize,
                marginFromLeft: 0,
                marginFromTop: 10,
                width: 0,
                textAlign: TextAlign.center),
            MyText(
                text: item.item4 ?? "",
                maxLine: 1,
                fontSize: MyFont.normalTextSize,
                marginFromLeft: 0,
                marginFromTop: 10,
                width: 0,
                textAlign: TextAlign.center)
          ],
        ));
  }

  @override
  void refresh() {
    // TODO: implement refresh
    setState(() {});
  }
}
