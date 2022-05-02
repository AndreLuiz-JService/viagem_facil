import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = Get.lazyPut<AuhtController>(() => AuhtController());
}