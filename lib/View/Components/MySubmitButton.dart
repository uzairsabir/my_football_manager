import 'package:my_football_manager/Support/Export/MyExport.dart';

class MySubmitButton extends StatelessWidget {
  String buttonText;
  double margin;
  double? width = 0;
  double? height = 0;
  GlobalKey<FormState> formKey;
  final Function(String) onChanged;

  MySubmitButton(
      {required this.formKey,
      required this.buttonText,
      this.width = 0,
      this.height = 0,
      required this.margin,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height == 0 ? 30 : height,
        width: width == 0 ? MediaQuery.of(context).size.width : width,
        margin: EdgeInsets.only(bottom: 0, top: 0, left: margin, right: margin),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: MyColor.getThemeColor(),
            primary: MyColor.getThemeColor(),
            minimumSize: Size(double.infinity, 40),
            padding: EdgeInsets.symmetric(horizontal: 0),
            side: BorderSide(
              width: 1.0,
              color: MyColor.getThemeColor(),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onChanged("");
              // print("local_form_${ FormVM().getItemByID(formID,"1")},${FormVM().getItemByID(formID,"2")},${FormVM().getItemByID(formID,"3")}");

              // if (menuID == 1) {
              //   DioClient().postInstitute(
              //       context: context,
              //       genericRequest: GenericRequest(
              //           parameter_1: "0",
              //           parameter_2: FormVM().getItemByID(formID, "1"),
              //           parameter_3: FormVM().getItemByID(formID, "2"),
              //           parameter_4: FormVM().getItemByID(formID, "3"),
              //           parameter_5: "",
              //           parameter_6: "",
              //           parameter_7: "",
              //           parameter_8: "",
              //           parameter_9: "",
              //           parameter_10: "",
              //           parameter_11: "",
              //           parameter_12: "",
              //           parameter_13: "",
              //           parameter_14: "",
              //           parameter_15: "",
              //           parameter_16: "",
              //           parameter_17: "",
              //           parameter_18: "",
              //           parameter_19: "10/10/2021",
              //           parameter_20: "10/10/2021"));
              // } else if (menuID == 2) {
              //   DioClient().postCampus(
              //       context: context,
              //       genericRequest: GenericRequest(
              //           parameter_1: "0",
              //           parameter_2: FormVM().getItemByID(formID, "2"),
              //           parameter_3: FormVM().getItemByID(formID, "3"),
              //           parameter_4: FormVM().getItemByID(formID, "4"),
              //           parameter_5: FormVM().getItemByID(formID, "1"),
              //           parameter_6: FormVM().getItemByID(formID, "5"),
              //           parameter_7: FormVM().getItemByID(formID, "6"),
              //           parameter_8: FormVM().getItemByID(formID, "7"),
              //           parameter_9: FormVM().getItemByID(formID, "8"),
              //           parameter_10: FormVM().getItemByID(formID, "9"),
              //           parameter_11: FormVM().getItemByID(formID, "11"),
              //           parameter_12: FormVM().getItemByID(formID, "12"),
              //           parameter_13: FormVM().getItemByID(formID, "14"),
              //           parameter_14: FormVM().getItemByID(formID, "15"),
              //           parameter_15: FormVM().getItemByID(formID, "16"),
              //           parameter_16: FormVM().getItemByID(formID, "13"),
              //           parameter_17: FormVM().getItemByID(formID, "10"),
              //           parameter_18: "",
              //           parameter_19: "10/10/2021",
              //           parameter_20: "10/10/2021"));
              // }
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
}
