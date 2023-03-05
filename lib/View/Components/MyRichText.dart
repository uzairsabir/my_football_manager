import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyRichText extends StatelessWidget {
  String fulltext, boldText;
  double width;
  int maxLine;
  double fontSize;
  double marginFromLeft;
  double marginFromTop;
  TextAlign textAlign;
  Color? color = MyColor.getAppText();
  FontWeight? fontWeight = MyFont.fontWeightRegular;

  MyRichText({
    required this.fulltext,
    required this.boldText,
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
        width: width == 0 ? MyString.getTextWidth(fulltext, fontSize) : width,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: boldText,
                  style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontFamily: MyFont.fontFamily,
                      fontWeight: MyFont.fontWeightMedium)),
              TextSpan(
                  text: fulltext,
                  style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontFamily: MyFont.fontFamily,
                      fontWeight: fontWeight)),
            ],
          ),
        )

        //  Text(
        //   text,
        //   textAlign: textAlign,
        //   style: TextStyle(
        //       color: color,
        //       fontSize: fontSize,
        //       fontFamily: MyFont.fontFamily,
        //       fontWeight: fontWeight),
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: maxLine,
        //   softWrap: true,
        // ),
        );
  }
}
