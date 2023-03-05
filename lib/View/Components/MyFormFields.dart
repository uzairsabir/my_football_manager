import 'dart:ui';

import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyFormFields {
  static final MyFormFields _singleton = MyFormFields._internal();

  final double borderThickness = 2.0;
  final double borderThicknessUnSelected = 1.0;
  final double borderRadius = 15.0;

  factory MyFormFields() {
    return _singleton;
  }

  MyFormFields._internal();

  Widget textFieldText(BuildContext context, String formID, String fieldName,
      String fieldID, String fieldValue, String _errorMsg, bool _isSingleLine) {
    var textController = new TextEditingController();

    final yourText = fieldValue;
    textController.value = textController.value.copyWith(
      text: textController.text + yourText,
    );
    // });
    // textController.value = fieldValue as TextEditingValue;

    //myFocusNode.

    return new TextFormField(
      initialValue: fieldValue,
      // focusNode: myFocusNode,
      // controller: textController,
      //  onTap: (){
      //    myFocusNode.requestFocus();
      //  },

      onChanged: (text) {
        //if(fieldName)
        // FormVM().updateItemByID(formID, fieldName, text, text);

        //focusNode[index].requestFocus();
      },

      decoration: new InputDecoration(
        labelText: fieldName,
        fillColor: Colors.white,

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getThemeColor(),
            width: borderThickness,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getError(),
            width: borderThicknessUnSelected,
          ),
        ),
        labelStyle: TextStyle(
            fontSize: MyFont.normalTextSize,
            color: MyColor.getAppText(),
            fontFamily: MyFont.fontFamily),

        ///hintText: "Password",
        //hintStyle: TextStyle(fontSize: MyFont.smallTextSize, color: MyColor.getThemeColor(), fontFamily: MyFont.fontFamily),
        contentPadding: EdgeInsets.all(10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getThemeColor(),
            width: borderThickness,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getAppText(),
            width: borderThicknessUnSelected,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 0),
          child: new SizedBox(
            height: 10,
            child: Icon(Icons.text_fields, color: MyColor.getThemeColor()),
          ), // add padding to adjust icon
          // child: Icon(Icons.help_outline),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (_errorMsg.isNotEmpty) {
          if (val == null || val.isEmpty) {
            return _errorMsg;
          }
        } else {
          return null;
        }
      },

      textCapitalization: TextCapitalization.sentences,
      keyboardType:
          _isSingleLine == true ? TextInputType.text : TextInputType.multiline,

      style: TextStyle(
          fontSize: MyFont.normalTextSize,
          fontWeight: MyFont.fontWeightRegular,
          fontFamily: MyFont.fontFamily,
          color: MyColor.getAppText()),
    );
  }

  Widget textFieldNumber(String formID, String fieldName, String fieldID,
      String fieldValue, String _errorMsg) {
    // var textController = new TextEditingController();

    // textController.text = fieldValue.isEmpty ? "": fieldValue;

    return new TextFormField(
      //controller: textController,
      initialValue: fieldValue,
      onChanged: (text) {
        //FormVM().updateItemByID(formID, fieldName, text, text);
      },
      decoration: new InputDecoration(
        labelText: fieldName,
        fillColor: Colors.white,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getThemeColor(),
            width: borderThickness,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getError(),
            width: borderThicknessUnSelected,
          ),
        ),
        labelStyle: TextStyle(
            fontSize: MyFont.normalTextSize,
            color: MyColor.getAppText(),
            fontFamily: MyFont.fontFamily),

        ///hintText: "Password",
        ///
        //hintStyle: TextStyle(fontSize: MyFont.smallTextSize, color: MyColor.getThemeColor(), fontFamily: MyFont.fontFamily),
        contentPadding: EdgeInsets.all(10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: MyColor.getThemeColor(),
            width: borderThickness,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: MyColor.getAppText(),
            width: borderThicknessUnSelected,
          ),
        ),

        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 0),
          child: new SizedBox(
            height: 10,
            child: Icon(
              Icons.confirmation_num_outlined,
              color: MyColor.getThemeColor(),
            ),
          ), // add padding to adjust icon
          // child: Icon(Icons.help_outline),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (_errorMsg.isNotEmpty) {
          if (val == null || val.isEmpty) {
            return _errorMsg;
          }
        } else {
          return null;
        }
      },

      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: MyFont.normalTextSize,
          fontWeight: MyFont.fontWeightRegular,
          fontFamily: MyFont.fontFamily,
          color: MyColor.getAppText()),
    );
  }

  Widget submitButton(BuildContext context, GlobalKey<FormState> _formKey,
      String formID, int menuID, String buttonText) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: MyColor.getThemeColor(),
            primary: MyColor.getThemeColor(),
            minimumSize: Size(double.infinity, 50),
            padding: EdgeInsets.symmetric(horizontal: 0),
            side: BorderSide(
              width: 1.0,
              color: MyColor.getThemeColor(),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              //print("local_form_${ FormVM().getItemByID(formID,"1")},${FormVM().getItemByID(formID,"2")},${FormVM().getItemByID(formID,"3")}");

            } else {
              //  print("local_form_${ FormVM().getItemByID(formID,"1")},${FormVM().getItemByID(formID,"2")},${FormVM().getItemByID(formID,"3")}");

            }
          },
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: MyFont.normalTextSize,
                fontWeight: MyFont.fontWeightRegular,
                fontFamily: MyFont.fontFamily,
                color: MyColor.getBackground()),
          ),
        ));
  }

  Widget ddl(
      BuildContext context,
      String formID,
      String fieldName,
      String fieldID,
      String fieldValue,
      String _errorMsg,
      String parentRowID,
      String childRowID) {
    // List<String> itemList =
    //     FormDDLVM().getItemStringList(fieldID, parentRowID, formID);
    var textController = new TextEditingController();
    textController.text = fieldValue.isEmpty ? fieldName : fieldValue;

    return GestureDetector(
      onTap: () {
        MyUtils.printMe("clicking");

        FocusScope.of(context).unfocus();
        // SelectDialog.showModal<String>(context,
        //     label: fieldName,
        //     selectedValue: "",
        //     items: itemList, onChange: (String selected) {
        //   //print("is_clicking_${FormDDLVM().getItemIDByName(selected, fieldID)}");

        //   FormVM().updateItemByID(formID, fieldName, selected,
        //       FormDDLVM().getItemIDByName(selected, fieldID));

        //   if (childRowID.isNotEmpty) {
        //     FormVM().updateItemEmptyByRowID(formID, childRowID);
        //   }
        // });
      },
      child: TextFormField(
        controller: textController,
        // enableInteractiveSelection: false,
        // focusNode: FocusNode(),
        enabled: false,
        //Not clickable and not editable
        //readOnly: true,
        // enabled: false,
        //initialValue:  fieldValue.isEmpty ? "" : fieldValue,
        decoration: new InputDecoration(
          labelText: fieldValue,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: MyColor.getAppText(),
              width: borderThicknessUnSelected,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: MyColor.getThemeColor(),
              width: borderThickness,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: MyColor.getError(),
              width: borderThicknessUnSelected,
            ),
          ),
          labelStyle: TextStyle(
              fontSize: MyFont.normalTextSize,
              color: MyColor.getAppText(),
              fontFamily: MyFont.fontFamily),

          contentPadding: EdgeInsets.all(10.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: MyColor.getThemeColor(),
              width: borderThickness,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: MyColor.getAppText(),
              width: borderThicknessUnSelected,
            ),
          ),

          prefixIcon: Padding(
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
          //fillColor: Colors.green
        ),
        validator: (val) {
          if (_errorMsg.isNotEmpty) {
            if (val == null || val.isEmpty) {
              return _errorMsg;
            }
          } else {
            return null;
          }
        },

        //keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: MyFont.normalTextSize,
            fontWeight: MyFont.fontWeightRegular,
            fontFamily: MyFont.fontFamily,
            color: MyColor.getAppText()),

        // shape: new RoundedRectangleBorder(
        //     borderRadius: new BorderRadius.circular(5.0)
        // )
      ),
    );
  }
}
