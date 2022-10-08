
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/utility/colors.dart';

class WidgetsCollection {
  BuildContext? context;
  BuildContext? dialogContext;

   WidgetsCollection(BuildContext sentContext) {
    context = sentContext;
  }

  startLoader() {
    return showDialog(
      context: context!,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (BuildContext context) {
        dialogContext = context;
        return WillPopScope(
            onWillPop: () async => false,
            child:
         Container(
          color: Colors.black.withOpacity(0.1),
          child: Center(
            child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor))
          ),
        ));
      },
    );
  }

  stopLoader() {
   // Navigator.of(dialogContext!).pop(false);
    Navigator.of(context!, rootNavigator: true).pop(context);

   // Navigator.of(dialogContext!).pop();
  }

}
