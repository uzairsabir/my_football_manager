import 'package:my_football_manager/Support/Export/MyExport.dart';
import 'package:image_network/image_network.dart';

class MyImageView extends StatelessWidget {
  double width;
  double height;
  String imageUrl;
  double padding;
  final Function(String) onChanged;

  MyImageView({
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.padding,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //MyUtils.printMe("image_file_$imageUrl");

    return InkWell(
        onTap: () {
          onChanged("");
        },
        child: Container(
            padding: EdgeInsets.only(
                top: padding, bottom: padding, left: padding, right: padding),
            child: (imageUrl.contains("https") || imageUrl.contains("http"))
                ? ImageNetwork(
                    image: imageUrl,
                    // imageCache: CachedNetworkImageProvider(imageUrl),
                    height: height,
                    width: width,
                    duration: 1500,
                    curve: Curves.easeIn,
                    onPointer: true,
                    debugPrint: false,
                    fullScreen: true,
                    fitAndroidIos: BoxFit.scaleDown,
                    fitWeb: BoxFitWeb.scaleDown,
                    borderRadius: BorderRadius.circular(10.0),
                    onLoading: const CircularProgressIndicator(
                      color: Colors.indigoAccent,
                    ),
                    onError: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    onTap: () {
                      onChanged("0");
                      //debugPrint("©gabriel_patrick_souza");
                    },
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: imageUrl.contains(",")
                        ? new Image.memory(Uint8List.fromList(
                            MyUtils.convertStringToUint8List(
                                '${this.imageUrl}')))
                        :

                        //  Image.file(
                        //     File('${this.imageUrl}'),
                        //     width: width,
                        //     height: height,
                        //     fit: BoxFit.fill,
                        //   )
                        new Image.asset(
                            'assets/images/${this.imageUrl}',
                            width: width,
                            height: height,
                            fit: BoxFit.scaleDown,
                          ),
                  )
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10.0),
            //   child: (imageUrl.contains("https") || imageUrl.contains("http"))
            //       ? Image.network(imageUrl)
            //       : imageUrl.contains("data/user")
            //           ? new Image.file(
            //               File('${this.imageUrl}'),
            //               width: width,
            //               height: height,
            //               fit: BoxFit.fill,
            //             )
            //           : new Image.asset(
            //               'assets/images/${this.imageUrl}',
            //               width: width,
            //               height: height,
            //               fit: BoxFit.scaleDown,
            //             ),
            // )
            ));
  }
}
