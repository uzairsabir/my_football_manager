import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyColor {
  //F8F0FD
  static const theme = Color(0xFF9B59B6);
  static const background = Color(0xffFFFFFF);

  static Color getThemeColor() {
    //var themeID = MyHelper.getPrefs(PREF_KEY_COLOR_THEME_ID);
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .theme)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getThemeLight() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .themeLight)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getBackground() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .background)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getAppBarText() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .appBarText)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getAppText() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .appText)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getFullTransparent() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .fullTransparent)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getBackgroundBlackTransparent() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .backgroundblack_transparent)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getError() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .error)!);
      }
    } catch (e) {}

    return background;
  }

  static Color getSuccess() {
    try {
      if (MyColorVM().getItem().values.length > 0) {
        return Color((MyColorVM()
            .getItem()
            .values
            .where((element) => element.isActive == true)
            .first
            .success)!);
      }
    } catch (e) {}

    return background;
  }

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
