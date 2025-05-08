import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_mvvm_bloc/config/routes/routes_name.dart';
import 'package:sample_mvvm_bloc/services/session_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      Timer(Duration(seconds: 3), () {
        SessionController().getUserFromPreference().then((value) {
          var a = SessionController().user.toJson();
          print(a['token']);
        });
        if (SessionController().isLogin == true) {
          // Navigate to the home screen if logged in
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.homeScreen, (route) => false);
        } else {
          // Navigate to the login screen if not logged in
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginScreen, (route) => false);
        }
      });
      // Check if the user is logged in
    }).onError((error, stackTrace) {
      // Handle error if needed
      Timer(Duration(seconds: 3), () {
        // Navigate to the home screen after the delay
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginScreen, (route) => false);
      });
    });
    // Simulate a delay for splash screen
  }
}
