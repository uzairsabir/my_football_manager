import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyEmptyView extends StatelessWidget {
  BuildContext context;
  String title;
  bool isFloatingMenuRequired;
  final Function(String) onChanged;
  double? height = 0.0;
  double? width = 0.0;

  MyEmptyView({
    required this.context,
    required this.title,
    this.height,
    this.width,
    required this.isFloatingMenuRequired,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: this.height == 0.0 ? 250 : this.height,
            width: this.width == 0.0 ? 500 : this.width,
            //margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height)/20),
            child: EmptyWidget(
                hideBackgroundAnimation: true,
                image: null,
                packageImage: PackageImage.Image_2,
                title:
                    '${MyLanguage.of(context)!.translateFromFile('No')} ${title} ${MyLanguage.of(context)!.translateFromFile('Found')}',
                subTitle: MyLanguage.of(context)!
                    .translateFromFile('Please try later'),
                titleTextStyle: TextStyle(
                  fontSize: MyFont.appTitleText,
                  color: MyColor.background,
                  fontWeight: MyFont.fontWeightRegular,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: MyFont.normalTextSize,
                  color: MyColor.background,
                  fontWeight: MyFont.fontWeightMedium,
                ))),
        Container(
            margin: EdgeInsets.only(top: 70, right: 20), child: Container()),
      ],
    );
  }
}
