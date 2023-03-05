import 'package:my_football_manager/Support/Export/MyExport.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await configDB();

  configLoading();

  await MyLanguage.setLanguage('en');

  await MyUtils.setPrefs(PREF_DIRECTION, LTR);

//Can be use for integration with other Apps.
  // String _defaultRoute = (token == null
  //     ? error
  //     : await MyUtils.isValidToken(token) == true
  //         ? home
  //         : error);

  String _defaultRoute = home;

  runApp(MyAppRunner(
    defaultRoute: _defaultRoute,
    notifyParent: refresh,
  ));
}

Future configDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MyColorVMAdapter());
  Hive.registerAdapter(MyListGridVMAdapter());
  Hive.registerAdapter(ScreenArgumentsVMAdapter());
  Hive.registerAdapter(TeamDetailVMAdapter());

  var key;
  var encryptionKey;
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey =
        await secureStorage.containsKey(key: DB_ENCRYPTION_KEY_HOLDER);
    if (!containsEncryptionKey) {
      key = Hive.generateSecureKey();
      await secureStorage.write(
          key: DB_ENCRYPTION_KEY_HOLDER, value: base64UrlEncode(key));
    }
    encryptionKey = base64Url
        .decode((await secureStorage.read(key: DB_ENCRYPTION_KEY_HOLDER))!);

    await Hive.openBox<MyColorVM>(MyColorVM.boxname,
        encryptionCipher: HiveAesCipher(encryptionKey));
    await Hive.openBox<MyListGridVM>(MyListGridVM.boxname,
        encryptionCipher: HiveAesCipher(encryptionKey));
    await Hive.openBox<ScreenArgumentsVM>(ScreenArgumentsVM.boxname,
        encryptionCipher: HiveAesCipher(encryptionKey));
    await Hive.openBox<TeamDetailVM>(TeamDetailVM.boxname,
        encryptionCipher: HiveAesCipher(encryptionKey));
  }

  MyColorVM().clearAllAdd();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 30.0
    ..radius = 10.0
    ..progressColor = MyColor.getThemeColor()
    ..backgroundColor = MyColor.getThemeColor()
    ..indicatorColor = MyColor.getBackground()
    ..textColor = MyColor.getBackground()
    ..maskColor = MyColor.getBackgroundBlackTransparent()
    ..userInteractions = false
    ..dismissOnTap = false;
}

refresh() {
  configLoading();
}

class MyAppRunner extends StatefulWidget {
  String defaultRoute;
  final Function() notifyParent;

  MyAppRunner(
      {Key? key, required this.defaultRoute, required this.notifyParent})
      : super(key: key);

  @override
  MyApp createState() =>
      MyApp(defaultRoute: defaultRoute, notifyParent: notifyParent);
}

class MyApp extends State<MyAppRunner> {
  String defaultRoute;
  final Function() notifyParent;

  MyApp({required this.defaultRoute, required this.notifyParent});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("defaultRoute $defaultRoute");

    return GetMaterialApp.router(
      key: _scaffoldKey,
      defaultTransition: Transition.fadeIn,
      getPages: AppPages(defaultRoute: defaultRoute).homePage,
      routerDelegate: AppRouterDelegate(defaultRoute: defaultRoute),
      title:
          (MyLanguage.of(context)?.translateFromFile("My Football Manager")) ??
              "My Football Manager",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: MyColor.getThemeColor(),
          fontFamily: MyFont.fontFamily,
          bottomAppBarColor: MyColor.getThemeColor(),
          backgroundColor: MyColor.getBackground(),
          primarySwatch: MyColor.generateMaterialColor(MyColor.getThemeColor()),
          scaffoldBackgroundColor: MyColor.getBackground(),
          canvasColor: MyColor.getThemeColor()),
      builder: EasyLoading.init(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ur', ''),
      ],
      localizationsDelegates: [
        MyLanguage.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
