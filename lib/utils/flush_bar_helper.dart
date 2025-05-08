import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushBarMessage(
      String message, bool isError, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          duration: Duration(seconds: 3),
          isDismissible: true,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: isError ? Colors.red : Colors.green.shade500,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          icon: isError
              ? Icon(
                  Icons.error,
                  size: 28.0,
                  color: Colors.red.shade100,
                )
              : Icon(
                  Icons.check_circle,
                  size: 28.0,
                  color: Colors.green.shade100,
                ),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(15),
          message: message,
        )..show(context));
  }
}
