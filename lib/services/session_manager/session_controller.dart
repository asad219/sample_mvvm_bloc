import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sample_mvvm_bloc/models/user/user_model.dart';
import 'package:sample_mvvm_bloc/services/storage/local_storage.dart';

class SessionController {
  // Singleton instance
  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  // Private constructor
  SessionController._internal() {
    // Initialize any resources or services here
    isLogin = false;
  }

  // Factory constructor to return the singleton instance
  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    await localStorage.setValue("user", jsonEncode(user));
    await localStorage.setValue("isLogin", "true");
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.getValue("user");

      var isLogin = await localStorage.getValue("isLogin");

      SessionController().isLogin = isLogin == "true" ? true : false;
      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
    } catch (e) {
      debugPrint("Error getting user from preference: $e");
    }
  }

  // Example method to demonstrate functionality
  void startSession() {
    print("Session started");
  }

  void endSession() {
    print("Session ended");
  }
}
