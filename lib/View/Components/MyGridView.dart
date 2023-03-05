import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyGridView extends StatelessWidget {
  Function()? notifyParent;
  final Function(String) onChanged;
  final Widget Function(int, String parentMenuID, MyListGridVM) container;
  final String parentMenuID;
  MyGridView(
      {required this.container,
      required this.parentMenuID,
      required this.columnRatio,
      this.notifyParent,
      required this.onChanged})
      : super();

  final int columnRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 260,
        width: double.infinity,
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<MyListGridVM>(MyListGridVM.boxname).listenable(),
          builder: (context, Box<MyListGridVM> box, widget) {
            return StaggeredGridView.countBuilder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 6,
              scrollDirection: Axis.vertical,
              itemCount: MyListGridVM(parentMenuID: parentMenuID)
                  .getItem(false, "")
                  .toList()
                  .length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => {onChanged("${index}")},
                  child: container(
                      index,
                      parentMenuID,
                      MyListGridVM(parentMenuID: parentMenuID)
                          .getItem(false, "")
                          .toList()[index])),
              staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
            );
          },
        ));
  }
}
