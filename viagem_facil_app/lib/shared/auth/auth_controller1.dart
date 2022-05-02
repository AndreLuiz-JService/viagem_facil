import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viagem_facil/shared/models/user_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';

class AuhtController extends GetxController {
  var _user = UserModel().obs;
  get user => _user;
  bool isLogged = false;
  bool isGoogle = false;

  void setUser(BuildContext context, UserModel? users) async {
    if (users != null) {
      await saveUser(users);
      _user.value = users;
      Get.offAndToNamed(RotasApp.Home);
      update();
    } else {
      Get.offAndToNamed(RotasApp.LOGINPAGE);
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  carregarUser() async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get(
      "user",
    ) as String;
    _user.value = UserModel.fromJson(json);
    update();
  }

  initializeUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get(
        "user",
      ) as String;
      setUser(context, UserModel.fromJson(json));
      _user.value = UserModel.fromJson(json);
      Get.offAndToNamed(RotasApp.Home);
      return;
    } else {
      Get.offAndToNamed(RotasApp.LOGINPAGE);
    }
    update();
  }

  Future<void> logout() async {
    if (isGoogle) {
      try {
        GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
          ],
        );
        await _googleSignIn.disconnect();
        final instance = await SharedPreferences.getInstance();
        await instance.remove("user");
        Get.toNamed(RotasApp.LOGINPAGE);
      } catch (e) {
        Get.snackbar(
          'Falha ao fazer logout',
          'Verifique a conexão a internet e tente novamente',
          backgroundColor: AppColors.primary,
          colorText: Colors.white,
          duration: Duration(seconds: 7),
          animationDuration: Duration(seconds: 1),
          isDismissible: true,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      }else{
        try {
        await FacebookAuth.instance.logOut();
        final instance = await SharedPreferences.getInstance();
        await instance.remove("user");
        Get.toNamed(RotasApp.LOGINPAGE);
      } catch (e) {
        Get.snackbar(
          'Falha ao fazer logout',
          'Verifique a conexão a internet e tente novamente',
          backgroundColor: AppColors.primary,
          colorText: Colors.white,
          duration: Duration(seconds: 7),
          animationDuration: Duration(seconds: 1),
          isDismissible: true,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
       
    }
  }
}
