import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyButton extends StatelessWidget {
  String text;

  Color borderColor;
  Color backgroundColor;
  Color textColor;
  Color hoverColor;
  double width;
  double margin;
  double topmargin;
  double? height = 30;
  final Function(String) onChanged;

  MyButton({
    required this.text,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    required this.hoverColor,
    required this.width,
    required this.margin,
    required this.topmargin,
    this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //MyUtils.printMe("my_width_${MyString.getTextWidth(text)}");

    return Container(
        margin: EdgeInsets.only(
            top: topmargin, right: margin, left: margin), //margin
        // color: MyColor.getThemeLight(),
        width: width != 0
            ? width
            : MyString.getTextWidth(text, MyFont.normalTextSize),
        height: height,
        // decoration: BoxDecoration(
        //   border: Border.all(color: borderColor),
        //   borderRadius: BorderRadius.circular(10),
        //   color: backgroundColor,
        // ),
        child: InkWell(
          onTap: () {
            onChanged(text);
          },
          // hoverColor: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
          hoverColor: hoverColor,

          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: backgroundColor),
                borderRadius: BorderRadius.circular(7.5),
                color: backgroundColor,
              ),

              // color: backgroundColor,
              height: this.height,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: textColor,
                      fontSize: MyFont.normalTextSize,
                      fontFamily: MyFont.fontFamily,
                      fontWeight: MyFont.fontWeightRegular),
                ),
              )),
        ));
  }
}
