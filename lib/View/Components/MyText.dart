import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyText extends StatelessWidget {
  String text;
  double width;
  int maxLine;
  double fontSize;
  double marginFromLeft;
  double marginFromTop;
  TextAlign textAlign;
  Color? color = MyColor.getAppText();
  FontWeight? fontWeight = MyFont.fontWeightRegular;

  MyText({
    required this.text,
    required this.maxLine,
    required this.fontSize,
    required this.marginFromLeft,
    required this.marginFromTop,
    required this.width,
    this.fontWeight,
    this.color,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginFromLeft, top: marginFromTop),
      width: width == 0 ? MyString.getTextWidth(text, fontSize) : width,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: MyFont.fontFamily,
            fontWeight: fontWeight),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        softWrap: true,
      ),
    );
  }
}
