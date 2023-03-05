import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyListView extends StatelessWidget {
  BuildContext context;
  final Function(String) onChanged;
  final Widget Function(int, String, MyListGridVM) container;
  final Axis axis;
  final String parentMenuID;
  final Color color;
  String isFavOnly;
  //final double margin = 0.0;
  final isReversed;
  double? height = 0;
  MyListView(
      {required this.context,
      required this.container,
      required this.parentMenuID,
      required this.axis,
      required this.color,
      required this.isFavOnly,
      required this.isReversed,
      this.height,
      required this.onChanged})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height == 0 ? MediaQuery.of(context).size.height : height,
        //width: double.infinity,
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<MyListGridVM>(MyListGridVM.boxname).listenable(),
          builder: (context, Box<MyListGridVM> box, widget) {
            return ListView.builder(
                primary: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: axis,
                shrinkWrap: true,
                itemCount: MyListGridVM(parentMenuID: parentMenuID)
                    .getItem(isReversed, isFavOnly)
                    .toList()
                    .length,
                itemBuilder: (context, index) => GestureDetector(
                      child: container(
                          index,
                          "${MyListGridVM(parentMenuID: parentMenuID).getItem(isReversed, isFavOnly).toList()[index].parentMenuID}",
                          MyListGridVM(parentMenuID: parentMenuID)
                              .getItem(isReversed, isFavOnly)
                              .toList()[index]),
                      onTap: () => {onChanged("${index}")},
                    ));
          },
          // staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
        ));
  }
}
