import 'package:my_football_manager/Support/Export/MyExport.dart';

class DashboardMobile_Main extends StatefulWidget {
  final Function() notifyParent;

  DashboardMobile_Main({required this.notifyParent});

  @override
  DashboardMobile createState() => DashboardMobile(notifyParent: notifyParent);
}

class DashboardMobile extends State<DashboardMobile_Main> {
  final Function() notifyParent;
  DashboardMobile({required this.notifyParent}) {}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      MyPermission().initPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: MyColor.getBackground(), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: false, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: MyColor.getBackground(),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      DashboardMobileHome_Main(
        context: context,
        notifyParent: refresh,
        title: (MyLanguage.of(context)?.translateFromFile('Home') ?? ""),
        menuID: Menu.home.index.toDouble(),
        parentMenuID: "${Menu.main.index}",
      ),
      DashboardMobileFav_Main(
        context: context,
        notifyParent: refresh,
        title: (MyLanguage.of(context)?.translateFromFile('Favourite') ?? ""),
        menuID: Menu.favourite.index.toDouble(),
        parentMenuID: "${Menu.main.index}",
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: (MyLanguage.of(context)?.translateFromFile('Home') ?? ""),
        activeColorPrimary: MyColor.getThemeColor(),
        inactiveColorPrimary: MyColor.getAppText(),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: (MyLanguage.of(context)?.translateFromFile('Favourite') ?? ""),
        activeColorPrimary: MyColor.getThemeColor(),
        inactiveColorPrimary: MyColor.getAppText(),
      )
    ];
  }

  void refresh() {
    // TODO: implement refresh
    setState(() {});
  }
}
