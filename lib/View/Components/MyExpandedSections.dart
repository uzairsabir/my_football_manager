import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyExpandedSections extends StatelessWidget {
  BuildContext context;
  Widget containers;
  int index;
  final Function(String) onChanged;

  MyExpandedSections({
    required this.context,
    required this.containers,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //MyUtils.printMe("MY_size_${ExpandedSectionVM().getItem().length}");

    return ExpansionPanelList(
        animationDuration: Duration(milliseconds: 1000),
        dividerColor: Colors.red,
        elevation: 1,
        children: [
          ExpansionPanel(
            body: containers,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                  padding: EdgeInsets.all(10),
                  child:
                      Align(alignment: Alignment.centerLeft, child: Container())

                  // MyText(
                  //     text: ExpandedSectionVM()
                  //             .getItem()
                  //             .getAt(index)
                  //             ?.headerTitle ??
                  //         "",
                  //     maxLine: 1,
                  //     fontSize: MyFont.appTitleText,
                  //     marginFromLeft: 0,
                  //     marginFromTop: 0,
                  //     width: 0,
                  //     textAlign: TextAlign.left),
                  //)
                  );
            },
            isExpanded: false,
          )
        ],
        expansionCallback: (int item, bool status) {
          MyUtils.printMe("MY_size_${status}");

          // ExpandedSectionVM().updateStatusByHeaderTitle(
          //     ExpandedSectionVM().getItem().getAt(index)?.headerTitle ?? "",
          //     !status);
          onChanged("");
        });
  }
}
