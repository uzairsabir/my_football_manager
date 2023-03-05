import 'package:my_football_manager/Support/Export/MyExport.dart';

class FormResponsiveGridLayout extends StatefulWidget {
  final int menuID;
  FormResponsiveGridLayout({required this.menuID});

  @override
  ResponsiveLayoutState createState() {
    return new ResponsiveLayoutState(menuID: menuID);
  }
  // @override
  // _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class ResponsiveLayoutState extends State<FormResponsiveGridLayout> {
  int menuID;
  ResponsiveLayoutState({required this.menuID});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return LayoutBuilder(
    //   builder: (context, dimens) {
    //     if (dimens.maxWidth <= kMobileBreakpoint) {
    //       return FormGridView(
    //         columnRatio: 12,
    //         menuID: menuID,
    //       );
    //     } else if (dimens.maxWidth > kMobileBreakpoint &&
    //         dimens.maxWidth <= kTabletBreakpoint) {
    //       return FormGridView(
    //         columnRatio: 7,
    //         menuID: menuID,
    //       );
    //     } else if (dimens.maxWidth > kTabletBreakpoint &&
    //         dimens.maxWidth <= kDesktopBreakPoint) {
    //       return FormGridView(
    //         columnRatio: 6,
    //         menuID: menuID,
    //       );
    //     } else {
    //       return FormGridView(
    //         columnRatio: 4,
    //         menuID: menuID,
    //       );
    //     }
    //   },
    // );
  }
}
