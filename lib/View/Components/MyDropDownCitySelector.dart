import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyDropDownCitySelector extends StatelessWidget {
  BuildContext context;
  String dropDownValue;

  final double borderThickness = 2.0;
  final double borderThicknessUnSelected = 1.0;
  final double borderRadius = 15.0;

  final Function(String) onChanged;

  MyDropDownCitySelector({
    required this.context,
    required this.dropDownValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: MyColor.getThemeLight(),
            primary: MyColor.getBackground(),
            elevation: 0,
            fixedSize: Size(double.maxFinite, 20),
            //minimumSize: Size(double.maxFinite - 100, 10),
            padding: EdgeInsets.symmetric(horizontal: 0),
            side: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),

          onPressed: () => {
            //FocusScope.of(context).unfocus(),
            SelectDialog.showModal<String>(context,
                label: "Select City",
                selectedValue: "",
                items: null, onChange: (String selected) {
              //print("is_clicking_${FormDDLVM().getItemIDByName(selected, fieldID)}");

              // FormVM().updateItemByID(formID, fieldName,selected,  FormDDLVM().getItemIDByName(selected, fieldID));
              //
              // if(childRowID.isNotEmpty){
              //
              //   FormVM().updateItemEmptyByRowID(formID, childRowID);
              //
              // }
            })
          },
          // padding: const EdgeInsets.all(0.0),

          child: new TextFormField(
            //controller: textController,

            enabled: false, //Not clickable and not editable
            //readOnly: true,
            // enabled: false,
            //initialValue:  fieldValue.isEmpty ? "" : fieldValue,
            decoration: new InputDecoration(
              border: InputBorder.none,
              labelText: "Karachi, Pakistan",
              fillColor: Colors.white,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: MyColor.getThemeColor(),
                  width: borderThickness,
                ),
              ),

              labelStyle: TextStyle(
                  fontSize: MyFont.normalTextSize,
                  color: MyColor.getAppText(),
                  fontFamily: MyFont.fontFamily),

              ///hintText: "Password",
              ///
              //hintStyle: TextStyle(fontSize: MyFont.smallTextSize, color: MyColor.getThemeColor(), fontFamily: MyFont.fontFamily),
              contentPadding: EdgeInsets.all(20.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: MyColor.getThemeColor(),
                  width: borderThickness,
                ),
              ),

              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 0),
                child: new SizedBox(
                  height: 10,
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: MyColor.getThemeColor(),
                  ),
                ), // add padding to adjust icon
                // child: Icon(Icons.help_outline),
              ),

              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 0),
                child: new SizedBox(
                  height: 10,
                  child: Icon(
                    Icons.location_on,
                    color: MyColor.getThemeColor(),
                  ),
                ), // add padding to adjust icon
                // child: Icon(Icons.help_outline),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {},

            //keyboardType: TextInputType.number,
            style: TextStyle(
                fontSize: MyFont.normalTextSize,
                fontWeight: MyFont.fontWeightRegular,
                fontFamily: MyFont.fontFamily,
                color: MyColor.getAppText()),
          ),
          // shape: new RoundedRectangleBorder(
          //     borderRadius: new BorderRadius.circular(5.0)
          // )
        ));
  }
}
