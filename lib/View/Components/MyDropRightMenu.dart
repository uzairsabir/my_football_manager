// import 'dart:async';

// import 'package:my_football_manager/Support/Export/MyExport.dart';

// class MyDropRight extends StatelessWidget {
//   BuildContext context;
//   String title;
//   bool isFloatingMenuRequired;
//   final Function(String) onChanged;
//   List<MyFloatingMenuVM>? floatingMenuList;

//   MyDropRight({
//     required this.context,
//     required this.title,
//     required this.isFloatingMenuRequired,
//     required this.onChanged,
//     this.floatingMenuList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return new Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//             height: 250,
//             width: 500,
//             //margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height)/20),
//             child: EmptyWidget(
//                 image: null,
//                 packageImage: PackageImage.Image_1,
//                 title:
//                     '${MyLanguage.of(context)!.translateFromFile('No')} ${title} ${MyLanguage.of(context)!.translateFromFile('Found')}',
//                 subTitle: MyLanguage.of(context)!
//                     .translateFromFile('Please try later'),
//                 titleTextStyle: TextStyle(
//                   fontSize: MyFont.appTitleText,
//                   color: MyColor.getAppText(),
//                   fontWeight: MyFont.fontWeightRegular,
//                 ),
//                 subtitleTextStyle: TextStyle(
//                   fontSize: MyFont.normalTextSize,
//                   color: MyColor.getAppText(),
//                   fontWeight: MyFont.fontWeightMedium,
//                 ))),
//         Container(
//             margin: EdgeInsets.only(top: 70, right: 20),
//             child: isFloatingMenuRequired ? floatingMenu() : Container()),
//       ],
//     );
//   }

//   void sideMenuLogic(int menuID, bool isActive) {
//     if (!isActive) {
//       Timer(const Duration(seconds: 1), () {
//         if (!sideMenuFocusedOnChild) {
//           if (sideMenuActiveIDWhenHover == menuID) {
//             sideMenuOpen = 0;
//             setState(() {});
//           }
//         }
//       });
//     } else {
//       sideMenuOpen = 1;

//       if (sideMenuOpen == 1) {
//         sideMenuActiveIDWhenHover = menuID;
//         // setState(() {});
//       }
//     }

//     // sideMenuOpen = 1;
//     setState(() {});
//   }
// }
