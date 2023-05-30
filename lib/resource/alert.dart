import 'package:flutter/cupertino.dart';

class SnackBarMessage{

  static void fieldFocusChange(
      BuildContext context ,
      FocusNode current,
      FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  /*static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }*/

  /*static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(
          seconds: 05
        ),
        borderRadius: BorderRadius.circular(30),
        margin: EdgeInsets.all(50),
        message: message,
      )..show(context),
    );
  }*/
}
