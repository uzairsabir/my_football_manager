import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyIcon extends StatelessWidget {
  double size;
  Color color;
  IconData iconData;
  String text;
  final Function(String) onChanged;
  MyIcon(
      {required this.iconData,
      required this.color,
      required this.size,
      required this.text,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onChanged(text);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Icon(
            iconData,
            color: color,
            size: size,
            //semanticLabel: text,
          ),
        ));
  }
}
