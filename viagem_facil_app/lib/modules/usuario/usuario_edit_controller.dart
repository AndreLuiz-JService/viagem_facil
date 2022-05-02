import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/models/user_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';

class UserEditController extends GetxController{
  final formKey = GlobalKey<FormState>();
  AuhtController userController = AuhtController();
  UserModel userModel = UserModel(name: '');

  String? validateNameCompleto(String? value) =>
      value?.isEmpty ?? true ? "O nome completo não pode ser vazio" : null;
  String? validateNameDeUsuario(String? value) =>
      value?.isEmpty ?? true ? "O nome de usuario não pode ser vazio" : null;

  String nameComplete = '';
  String nameUser = '';

  void saveUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get(
      "user",
    ) as String;
    final user = UserModel.fromJson(json);
    final UserModel userAtualizado = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      photoURL: user.photoURL,
      nameComplete: nameComplete,
      userName: nameUser,
    );
    await instance.setString("user", userAtualizado.toJson());
    Get.offAndToNamed(RotasApp.Conta,arguments: userAtualizado);
  }

  void alterarUser(BuildContext context,) async {
    final form = formKey.currentState;
    if (form!.validate()) {
        saveUser(context);
    }
  }
}
