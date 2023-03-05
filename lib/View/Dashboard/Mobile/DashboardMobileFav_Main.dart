import 'package:my_football_manager/Support/Export/MyExport.dart';

class DashboardMobileFav_Main extends StatefulWidget implements ScreenLoadView {
  final Function() notifyParent;
  String title;
  double menuID;
  String parentMenuID;
  BuildContext context;

  DashboardMobileFav_Main(
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
    await CompetitionService().getTeamsByLeagueID(
        context: context,
        menuID: "${menuID}",
        leagueID: "2001",
        isShowLoader: true,
        isHideLoader: true);
  }

  @override
  DashboardMobileFav createState() => DashboardMobileFav(
      notifyParent: notifyParent,
      title: title,
      menuID: menuID,
      parentMenuID: parentMenuID);
}

class DashboardMobileFav extends State<DashboardMobileFav_Main>
    implements ScreenItem1, Structure {
  final Function() notifyParent;

  DashboardMobileFav(
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
    int itemCount =
        MyListGridVM(parentMenuID: "${menuID}").getItem(false, "1").length;

    return Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(
          pageTitle: "${title} (${itemCount})",
          rightIcon: Icons.clear,
          isBackButton: false,
          notificationCounter: 0,
          onRightChanged: (String value) {},
        ),
        body: Container(
          color: MyColor.getThemeColor(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: itemCount == 0
              ? MyEmptyView(
                  context: context,
                  title: title,
                  height: 100,
                  width: 300,
                  isFloatingMenuRequired: false,
                  onChanged: (String value) {})
              : MyListView(
                  //height: 215 * 2,
                  isFavOnly: "1",
                  context: context,
                  container: getItem1,
                  parentMenuID: "${menuID}",
                  axis: Axis.vertical,
                  color: MyColor.getThemeColor(),
                  isReversed: false,
                  onChanged: (String value) async {
                    await TeamDetailVM.clearAll();

                    MyClickHandler().Open(
                        context,
                        TeamDetail_Main(
                            context: context,
                            notifyParent: refresh,
                            title: MyListGridVM(parentMenuID: "${menuID}")
                                    .getItem(false, "1")
                                    .elementAt(int.parse(value))
                                    .item1 ??
                                "",
                            menuID: MyListGridVM(parentMenuID: "${menuID}")
                                    .getItem(false, "1")
                                    .elementAt(int.parse(value))
                                    .menuID ??
                                0.0,
                            parentMenuID: parentMenuID));
                  }),
        ));
  }

  @override
  Widget getItem1(int index, String parentMenuID, MyListGridVM item) {
    // TO`DO: implement getItem2
    String bodyData =
        "${item.item3}|${item.item4}|${item.item5}|${item.item6}|${item.item7}|${item.item8}";

    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: MyColor.getThemeColor(),
          borderRadius: BorderRadius.all(Radius.circular(10.0) //
              ),
          border: Border.all(width: 0.5, color: MyColor.background)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: MyProfileImage(
                      imageurl: item.item2!,
                      radius: 25,
                      onChanged: (String value) {})),
              MyText(
                  text: item.item1 ?? "",
                  maxLine: 1,
                  fontSize: MyFont.appTitleText,
                  marginFromLeft: 10,
                  marginFromTop: 10,
                  width: 0,
                  fontWeight: MyFont.fontWeightLight,
                  color: MyColor.background,
                  textAlign: TextAlign.center)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            color: MyColor.background,
            height: 0.1,
          ),
          for (var i in bodyData.split("|"))
            MyText(
                text: i,
                maxLine: 1,
                fontSize: MyFont.normalTextSize,
                marginFromLeft: 10,
                marginFromTop: 10,
                width: 0,
                fontWeight: MyFont.fontWeightLight,
                color: MyColor.background,
                textAlign: TextAlign.left),
          // MyText(
          //     text: item.item4 ?? "",
          //     maxLine: 1,
          //     fontSize: MyFont.normalTextSize,
          //     marginFromLeft: 10,
          //     marginFromTop: 10,
          //     width: 0,
          //     fontWeight: MyFont.fontWeightLight,
          //     color: MyColor.background,
          //     textAlign: TextAlign.left),
          // MyText(
          //     text: item.item5 ?? "",
          //     maxLine: 1,
          //     fontSize: MyFont.normalTextSize,
          //     marginFromLeft: 10,
          //     marginFromTop: 10,
          //     width: 0,
          //     fontWeight: MyFont.fontWeightLight,
          //     color: MyColor.background,
          //     textAlign: TextAlign.left),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.only(right: 20),
                child: MyIcon(
                    onChanged: (String value) {
                      //MyText
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        btnOkColor: MyColor.getThemeColor(),
                        btnCancelText:
                            MyLanguage.of(context)!.translateFromFile("No"),
                        btnOkText:
                            MyLanguage.of(context)!.translateFromFile("Yes"),
                        descTextStyle: TextStyle(
                            color: MyColor.getAppText(),
                            fontSize: MyFont.normalTextSize,
                            fontFamily: MyFont.fontFamily,
                            fontWeight: MyFont.fontWeightMedium),
                        titleTextStyle: TextStyle(
                            color: MyColor.getAppText(),
                            fontSize: MyFont.appTitleText,
                            fontFamily: MyFont.fontFamily,
                            fontWeight: MyFont.fontWeightMedium),
                        title: MyLanguage.of(context)!
                            .translateFromFile("Message"),
                        desc: MyLanguage.of(context)!.translateFromFile(
                            "Do you want to remove ${value} from your Favourite list?"),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          MyListGridVM(parentMenuID: "${menuID}")
                              .updateItemFavStatus(item.menuID!.toDouble());
                          refresh();
                        },
                      )..show();
                    },
                    iconData: Icons.favorite,
                    color: MyColor.background,
                    size: 30,
                    text: item.item1!)),
          )
        ],
      ),
    );
  }

  @override
  void refresh() {
    // TODO: implement refresh
    setState(() {});
  }
}
