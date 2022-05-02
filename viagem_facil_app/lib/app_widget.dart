import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/Splash/Splash_page.dart';
import 'package:viagem_facil/modules/home/home_page.dart';
import 'package:viagem_facil/modules/itens_documentacao/item_selecionado_page.dart';
import 'package:viagem_facil/modules/itens_documentacao/itens_documentacao_controller.dart';
import 'package:viagem_facil/modules/login_page/login_page.dart';
import 'package:viagem_facil/modules/malas/malas_page.dart';
import 'package:viagem_facil/modules/malas_prontas/malas_prontas_page.dart';
import 'package:viagem_facil/modules/usuario/usuario_edit_page.dart';
import 'package:viagem_facil/modules/usuario/usuario_page.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';

import 'modules/itens_documentacao/itens_documentacao_page.dart';
import 'modules/malas_prontas/mala_selecionada_page.dart';
import 'shared/models/user_model.dart';
import 'shared/routes/routes_principal.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: AppColors.primary,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RotasApp.SPLASHPAGE,
      routes: {
         RotasApp.SPLASHPAGE: (context) => SplashPage(),
        RotasApp.Home: (context) => HomePage(),
        RotasApp.Conta: (context) => UsuarioPage(),
        RotasApp.ITENS: (context) => LoginPage(),
        RotasApp.MALASPRONTAS: (context) => MalasProntasPage(),
        RotasApp.MALAS: (context) => MalasPage(),
        RotasApp.LOGINPAGE: (context) => LoginPage(),
        RotasApp.EDITUSER: (context) => UsuarioEditPage(),
        RotasApp.ITENSDOCUMENTACAO: (context) => ItensEDocumentacaoPage(),
        RotasApp.ITENSDOCUMENTACAOSelecionado: (context) => ItemSelecionadoPage(),
      },
    );
  }
}

class Login {}
