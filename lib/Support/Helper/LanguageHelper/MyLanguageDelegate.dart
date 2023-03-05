import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyLanguageDelegate extends LocalizationsDelegate<MyLanguage> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const MyLanguageDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ur'].contains(locale.languageCode);
  }

  @override
  Future<MyLanguage> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    MyLanguage localizations = new MyLanguage(locale);
    //await MyHelper.getPrefs(locale.languageCode);
    await localizations.loadFromFile();
    return localizations;
  }

  @override
  bool shouldReload(MyLanguageDelegate old) => false;
}
