import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyLanguage {
  final Locale locale;
  MyLanguage(this.locale);
  late Map<String, String> _localizedStrings;

  static MyLanguage? of(BuildContext context) {
    return Localizations.of<MyLanguage>(context, MyLanguage);
  }

  static Future setLanguage(String language) async {
    await MyUtils.setPrefs(PREF_LANGUAGE, language);
  }

  static const LocalizationsDelegate<MyLanguage> delegate =
      MyLanguageDelegate();

  Future<bool> loadFromFile() async {
    String language = await MyUtils.getPrefs(PREF_LANGUAGE);

    String jsonString =
        await rootBundle.loadString('assets/language/$language.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translateFromFile(String key) {
    try {
      return _localizedStrings[key] ?? key;
    } catch (e) {}

    return key;
  }

  static Future<String> translateFromGoogle(String input) async {
    String language = await MyUtils.getPrefs(PREF_LANGUAGE);

    if (language == "en") {
      return input;
    }
    final translator = GoogleTranslator();

    var translation =
        await translator.translate(input, from: 'en', to: language);
    print(
        '${translation.source} (${translation.sourceLanguage}) == ${translation.text} (${translation.targetLanguage})');

    return translation.text;
  }
}

//
// hl=af          Afrikaans
// hl=ak          Akan
// hl=sq          Albanian
// hl=am          Amharic
// hl=ar          Arabic
// hl=hy          Armenian
// hl=az          Azerbaijani
// hl=eu          Basque
// hl=be          Belarusian
// hl=bem         Bemba
// hl=bn          Bengali
// hl=bh          Bihari
// hl=xx-bork     Bork, bork, bork!
// hl=bs          Bosnian
// hl=br          Breton
// hl=bg          Bulgarian
// hl=km          Cambodian
// hl=ca          Catalan
// hl=chr         Cherokee
// hl=ny          Chichewa
// hl=zh-CN       Chinese (Simplified)
// hl=zh-TW       Chinese (Traditional)
// hl=co          Corsican
// hl=hr          Croatian
// hl=cs          Czech
// hl=da          Danish
// hl=nl          Dutch
// hl=xx-elmer    Elmer Fudd
// hl=en          English
// hl=eo          Esperanto
// hl=et          Estonian
// hl=ee          Ewe
// hl=fo          Faroese
// hl=tl          Filipino
// hl=fi          Finnish
// hl=fr          French
// hl=fy          Frisian
// hl=gaa         Ga
// hl=gl          Galician
// hl=ka          Georgian
// hl=de          German
// hl=el          Greek
// hl=gn          Guarani
// hl=gu          Gujarati
// hl=xx-hacker   Hacker
// hl=ht          Haitian Creole
// hl=ha          Hausa
// hl=haw         Hawaiian
// hl=iw          Hebrew
// hl=hi          Hindi
// hl=hu          Hungarian
// hl=is          Icelandic
// hl=ig          Igbo
// hl=id          Indonesian
// hl=ia          Interlingua
// hl=ga          Irish
// hl=it          Italian
// hl=ja          Japanese
// hl=jw          Javanese
// hl=kn          Kannada
// hl=kk          Kazakh
// hl=rw          Kinyarwanda
// hl=rn          Kirundi
// hl=xx-klingon  Klingon
// hl=kg          Kongo
// hl=ko          Korean
// hl=kri         Krio (Sierra Leone)
// hl=ku          Kurdish
// hl=ckb         Kurdish (Soranî)
// hl=ky          Kyrgyz
// hl=lo          Laothian
// hl=la          Latin
// hl=lv          Latvian
// hl=ln          Lingala
// hl=lt          Lithuanian
// hl=loz         Lozi
// hl=lg          Luganda
// hl=ach         Luo
// hl=mk          Macedonian
// hl=mg          Malagasy
// hl=ms          Malay
// hl=ml          Malayalam
// hl=mt          Maltese
// hl=mi          Maori
// hl=mr          Marathi
// hl=mfe         Mauritian Creole
// hl=mo          Moldavian
// hl=mn          Mongolian
// hl=sr-ME       Montenegrin
// hl=ne          Nepali
// hl=pcm         Nigerian Pidgin
// hl=nso         Northern Sotho
// hl=no          Norwegian
// hl=nn          Norwegian (Nynorsk)
// hl=oc          Occitan
// hl=or          Oriya
// hl=om          Oromo
// hl=ps          Pashto
// hl=fa          Persian
// hl=xx-pirate   Pirate
// hl=pl          Polish
// hl=pt-BR       Portuguese (Brazil)
// hl=pt-PT       Portuguese (Portugal)
// hl=pa          Punjabi
// hl=qu          Quechua
// hl=ro          Romanian
// hl=rm          Romansh
// hl=nyn         Runyakitara
// hl=ru          Russian
// hl=gd          Scots Gaelic
// hl=sr          Serbian
// hl=sh          Serbo-Croatian
// hl=st          Sesotho
// hl=tn          Setswana
// hl=crs         Seychellois Creole
// hl=sn          Shona
// hl=sd          Sindhi
// hl=si          Sinhalese
// hl=sk          Slovak
// hl=sl          Slovenian
// hl=so          Somali
// hl=es          Spanish
// hl=es-419      Spanish (Latin American)
// hl=su          Sundanese
// hl=sw          Swahili
// hl=sv          Swedish
// hl=tg          Tajik
// hl=ta          Tamil
// hl=tt          Tatar
// hl=te          Telugu
// hl=th          Thai
// hl=ti          Tigrinya
// hl=to          Tonga
// hl=lua         Tshiluba
// hl=tum         Tumbuka
// hl=tr          Turkish
// hl=tk          Turkmen
// hl=tw          Twi
// hl=ug          Uighur
// hl=uk          Ukrainian
// hl=ur          Urdu
// hl=uz          Uzbek
// hl=vi          Vietnamese
// hl=cy          Welsh
// hl=wo          Wolof
// hl=xh          Xhosa
// hl=yi          Yiddish
// hl=yo          Yoruba
// hl=zu          Zulu



