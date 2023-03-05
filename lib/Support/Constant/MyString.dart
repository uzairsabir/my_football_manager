import '../Export/MyExport.dart';

class MyString {
  static double getTextWidth(String text, double fontSize) {
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        maxLines: 1,
        text: TextSpan(
            text: text,
            style:
                TextStyle(fontFamily: MyFont.fontFamily, fontSize: fontSize)))
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width + 20;
  }

  static String convertToTitleCase(String text) {
    if (text.isEmpty) {
      return text;
    }

    if (text.length <= 1) {
      return text.toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = text.split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }

  static String removeLastCharacters(String text, int characterCount) {
    try {
      return text.substring(0, text.length - characterCount);
    } catch (e) {}

    return text;
  }
}
