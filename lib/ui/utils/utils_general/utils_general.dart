import 'package:flutter/material.dart';
class UtilsGeneral {

 showBottomSheetResetPassword({required BuildContext context,required Widget child}) {
   //final TextEditingController mailController=TextEditingController();
   return showModalBottomSheet(
     //isDismissible: false,
       isScrollControlled: true,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(30),
           topRight: Radius.circular(30),
         ),
       ),
       context: context,
       builder: (builder) {
         return child;
       });
 }

}

