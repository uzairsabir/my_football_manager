import 'package:my_football_manager/Support/Export/MyExport.dart';

class TeamDetail_Main extends StatefulWidget implements ScreenLoadView {
  final Function() notifyParent;
  String title;
  double menuID;
  String parentMenuID;
  BuildContext context;

  TeamDetail_Main(
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

    await StandingService().getTeamsStandingAndResults(
        context: context,
        menuID: "${menuID}",
        leagueID: "2001",
        isShowLoader: true,
        isHideLoader: true);

    refresh();
  }

  @override
  TeamDetail createState() => TeamDetail(
      notifyParent: notifyParent,
      title: title,
      menuID: menuID,
      parentMenuID: parentMenuID);
}

class TeamDetail extends State<TeamDetail_Main> implements Structure {
  final Function() notifyParent;

  TeamDetail(
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
    return Scaffold(
        backgroundColor: MyColor.getThemeColor(),
        key: _scaffoldKey,
        appBar: MyAppBar(
          pageTitle: "${title}",
          rightIcon: Icons.clear,
          isBackButton: true,
          notificationCounter: 0,
          onRightChanged: (String value) {},
        ),
        body: Container(
          color: MyColor.getThemeColor(),
          height: 380,
          width: MediaQuery.of(context).size.width,
          child: getItemView(),
        ));
  }

  Widget getItemView() {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<TeamDetailVM>(TeamDetailVM.boxname).listenable(),
        builder: (context, Box<TeamDetailVM> box, widget) {
          return getItem(TeamDetailVM.getItem());
        });
  }

  Widget getItem(TeamDetailVM item) {
    String bodyData =
        "${item.group}|${item.position}|${item.played}|${item.won}|${item.draw}|${item.lost}|${item.points}|${item.goalsFor}|${item.goalsAgainst}|${item.goalDifference}";

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
              MyText(
                  text: MyLanguage.of(context)!.translateFromFile("Results:"),
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
                marginFromLeft: 20,
                marginFromTop: 10,
                width: 0,
                fontWeight: MyFont.fontWeightLight,
                color: MyColor.background,
                textAlign: TextAlign.left),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: MyProfileImage(
                  imageurl: item.crest ?? "",
                  radius: 25,
                  onChanged: (String value) {}),
            ),
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
