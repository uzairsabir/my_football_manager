import 'package:my_football_manager/Support/Export/MyExport.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MyUtils {
  static String dateTimeDisplayFormat = "EEE d MMM,yyyy hh:mm aa";

  static Future<String> getPrefs(String key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return (prefs.getString(key) ?? "");
  }

  static Future<bool> setPrefs(String key, String value) async {
    late Future<bool> _status;

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    _status = prefs.setString(key, value).then((bool success) {
      return _status;
    });

    return false;
  }

  static Future<bool> isLogin() async {
    String _result = await getPrefs(PREF_KEY_USER_LOGIN_ID);

    if (_result.isEmpty) {
      return false;
    }

    return true;
  }

  static Future<String> deviceType() async {
    if (!kIsWeb && Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return 'Android: ${androidInfo.model}';
    } else if (!kIsWeb && Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return 'iPhone: ${iosInfo.utsname.machine}';
    } else {
      return "Web";
    }
  }

  static showSnackBarInfo(BuildContext context, String text) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: text,
      ),
    );
  }

  static showSnackBarSuccess(BuildContext context, String text) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: text,
      ),
    );
  }

  static showSnackBarError(BuildContext context, String text) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: text,
      ),
    );
  }

  static showloader(BuildContext context) {
    try {
      EasyLoading.show(
        status: (MyLanguage.of(context)?.translateFromFile('loading'))!,
        maskType: EasyLoadingMaskType.custom,
      );
    } catch (e) {}
  }

  static hideloader() {
    try {
      EasyLoading.dismiss();
    } catch (e) {}
  }

  static printMe(String text) {
    if (IS_LOG_ON == "true") {
      // var logger = Logger(
      //   printer: PrettyPrinter(
      //       methodCount: 2, // number of method calls to be displayed
      //       errorMethodCount: 8, // number of method calls if stacktrace is provided
      //       lineLength: 10000, // width of the output
      //       colors: true, // Colorful log messages
      //       printEmojis: true, // Print an emoji for each log message
      //       printTime: false // Should each log print contain a timestamp
      //   ),
      // );
      // logger.d(text);

      //debugPrint('Decibel Log : $text');

      print(text);
    }
  }

  static String displayDateTimeFromDevice() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(dateTimeDisplayFormat).format(now);
    return formattedDate.toString();
  }

  static routeToModal(BuildContext context, Widget screen) {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => screen,
    );
  }

  static bool isValidDate(String fromDate, String toDate) {
    DateTime dt1 = DateTime.parse("$fromDate 12:00:00");
    DateTime dt2 = DateTime.parse("$toDate 12:00:00");

    if (dt1.compareTo(dt2) == 0) {
      print("Both date time are at same moment.");

      return false;
    }

    if (dt1.compareTo(dt2) < 0) {
      print("DT1 is before DT2");

      return true;
    }

    if (dt1.compareTo(dt2) > 0) {
      print("DT1 is after DT2");

      return false;
    }
    return false;
  }

  static String formateDateForDateTimeSelector(String mmddyyyy) {
    try {
      if (mmddyyyy.contains(",")) {
        String split_mmddyyyy_into_mmdd = mmddyyyy.split(",")[0];
        String split_mmddyyyy_into_yyyy = mmddyyyy.split(",")[1];
        String split_mmdd_into_mm =
            _convertMonthNameToOrdinal(split_mmddyyyy_into_mmdd.split(" ")[0]);
        String split_mmdd_into_dd = split_mmddyyyy_into_mmdd.split(" ")[1];

        MyUtils.printMe(
            "converted_dates_${split_mmddyyyy_into_yyyy.trim()}-${split_mmdd_into_mm.trim()}-${split_mmdd_into_dd.trim()}");

        return "${split_mmddyyyy_into_yyyy.trim()}-${split_mmdd_into_mm.trim()}-${split_mmdd_into_dd.trim()}";
      }
    } catch (e) {}

    return mmddyyyy;
  }

  static String _convertMonthNameToOrdinal(String monthName) {
    switch (monthName) {
      case 'Jan':
        {
          return '01';
        }

      case 'Feb':
        {
          return '02';
        }

      case 'Mar':
        {
          return '03';
        }

      case 'Apr':
        {
          return '04';
        }

      case 'May':
        {
          return '05';
        }

      case 'Jun':
        {
          return '06';
        }

      case 'Jul':
        {
          return '07';
        }

      case 'Aug':
        {
          return '08';
        }

      case 'Sep':
        {
          return '09';
        }

      case 'Oct':
        {
          return '10';
        }

      case 'Nov':
        {
          return '11';
        }

      case 'Dec':
        {
          return '12';
        }
    }

    return monthName;
  }

  static RichText richText(String no1, String no2) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: no1,
              style: const TextStyle(fontWeight: MyFont.fontWeightMedium)),
          TextSpan(
            text: no2,
          ),
        ],
      ),
    );
  }

  static Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  static String convertUint8ListToString(Uint8List uint8list) {
    return String.fromCharCodes(uint8list);
  }

  static Future<void> launchLink(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  static String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }
}
