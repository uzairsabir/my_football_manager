import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyCard extends StatelessWidget {
  BuildContext context;
  double? height;
  double? width;
  Widget item;
  double margin;
  Color color;

  MyCard({
    required this.context,
    required this.height,
    required this.margin,
    required this.color,
    required this.item,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        elevation: 10,
        shadowColor: MyColor.getAppText(),
        margin: EdgeInsets.only(
            left: margin, right: margin, bottom: 10.0, top: 10.0),
        child: Container(
          padding: EdgeInsets.only(top: 0),
          height: height,
          width: width,
          child: item,
        ));
  }
}
