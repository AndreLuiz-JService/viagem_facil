import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authontroller = AuhtController();
    authontroller.initializeUser(context);
    return Container(
      color: AppColors.splashPage,
      child: Center(
        child: Hero(
          tag: 'Imagen Splash',
          transitionOnUserGestures: true,
          child: Image.asset(
            AppImages.imagen_splash_page,
            height: 200,
          ),

        ),
      ),
    );
  }
}
