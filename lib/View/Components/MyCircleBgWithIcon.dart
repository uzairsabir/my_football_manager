import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyCircleBgWithIcon extends StatelessWidget {
  String imageurl;
  double radius;
  Color color;
  final Function(String) onChanged;

  MyCircleBgWithIcon({
    required this.imageurl,
    required this.radius,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          onChanged("");
        },
        child: Container(
            padding: EdgeInsets.all(15),
            child: imageurl.contains("https")
                ? Image.network(
                    imageurl,
                    fit: BoxFit.cover,
                    color: color,
                  )
                : Image.asset(
                    imageurl,
                    fit: BoxFit.cover,
                    color: color,
                  ),
            height: radius,
            width: radius,
            decoration: BoxDecoration(
              color: MyColor.getThemeLight(),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            )));
  }
}
