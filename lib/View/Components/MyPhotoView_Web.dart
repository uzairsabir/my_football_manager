import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyPhotoView_Web extends StatelessWidget {
  List<MyListGridVM> imageList = [];
  int index;
  BuildContext context;
  MyPhotoView_Web(
      {required this.context, required this.imageList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: MyColor.getThemeLight(),
      child: getImageView(index),
      // PageView.builder(
      //     physics: ClampingScrollPhysics(),
      //     scrollDirection: Axis.horizontal,
      //     itemCount: imageList.length,
      //     itemBuilder: (context, index) => GestureDetector(
      //           child: getImageView(index),
      //           onTap: () => {},
      //         ))

      // ListView.builder(
      //     primary: true,
      //     physics: ClampingScrollPhysics(),
      //     scrollDirection: Axis.horizontal,
      //     shrinkWrap: true,
      //     itemCount: imageList.length,
      //     itemBuilder: (context, index) => GestureDetector(
      //           child: getImageView(index),
      //           onTap: () => {},
      //         ))
    );
  }

  Widget getImageView(int myIndex) {
    print("my_index_${myIndex}");
    return MyImageView(
        imageUrl: imageList[myIndex].item3!,
        width: 400,
        height: MediaQuery.of(context).size.height,
        padding: 0,
        onChanged: (String value) {});
  }
}
