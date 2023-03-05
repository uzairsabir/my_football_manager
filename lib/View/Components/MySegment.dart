import 'package:my_football_manager/Support/Export/MyExport.dart';

class MySegment extends StatelessWidget {
  BuildContext context;
  bool isActive;
  int count;
  String buttonText;
  final Function(String) onChanged;

  MySegment(
      {required this.context,
      required this.isActive,
      required this.count,
      required this.buttonText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 60, bottom: 30),
      // width: 100,
      child: InkWell(
          onTap: () {
            onChanged("${buttonText}");
          },
          child: Container(
            height: 30,
            width: 100,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isActive == false
                    ? MyColor.background
                    : MyColor.getThemeColor(),
                border: Border.all(color: MyColor.getThemeColor())),
            child: Center(
                child: MyText(
                    text: "${buttonText} (${count})",
                    maxLine: 1,
                    fontSize: MyFont.normalTextSize,
                    marginFromLeft: 0,
                    marginFromTop: 0,
                    width: 0,
                    color: isActive == true
                        ? MyColor.background
                        : MyColor.getThemeColor(),
                    textAlign: TextAlign.center)),
          )
          // Container(
          //     margin: EdgeInsets.only(top: 10, left: 30),
          //     height: 30,
          //     width: 100,
          //     child: MyText(
          //         text: "${buttonText}(${count})",
          //         maxLine: 1,
          //         fontSize: MyFont.appTitleText,
          //         marginFromLeft: 10,
          //         marginFromTop: 0,
          //         width: 0,
          //         color: isActive == 1
          //             ? MyColor.getThemeColor()
          //             : MyColor.getBackground(),
          //         textAlign: TextAlign.left))

          ),
    );
  }
}
