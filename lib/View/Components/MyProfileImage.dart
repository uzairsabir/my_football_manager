import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyProfileImage extends StatelessWidget {
  String imageurl;
  double radius;
  final Function(String) onChanged;

  MyProfileImage({
    required this.imageurl,
    required this.radius,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return imageurl.contains("svg") == true
        ? SvgPicture.network(
            imageurl,
            width: radius + 20,
            height: radius + 20,

            //semanticsLabel: '',
            // placeholderBuilder: (BuildContext context) => Container(
            //     //padding: EdgeInsets.all(radius),
            //     child: const CircularProgressIndicator()),
          )
        : CircleAvatar(
            radius: radius, backgroundImage: (NetworkImage(imageurl)));
  }
}
