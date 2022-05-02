import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/social_login/social_login_button.dart';
import 'package:viagem_facil/shared/widget/textFormWidget/text_form_widget.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.splashPage,
          child: Column(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Get.toNamed(RotasApp.SPLASHPAGE),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Hero(
                      tag: 'Imagen Splash',
                      transitionOnUserGestures: true,
                      child: Image.asset(
                        AppImages.imagen_splash_page,
                      )),
                ),
              ),
              Spacer(
                flex: 3,
              ),
              AnimatedCard(
                duration: Duration(milliseconds: 700),
                direction: AnimatedCardDirection.left,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                  child: SocialLoginButton(
                    text: 'Conecte-se via Google',
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    cor: AppColors.googleColor,
                    onTap: () => controller.googleSignIn(context),
                  ),
                ),
              ),
              AnimatedCard(
                duration: Duration(milliseconds: 700),
                direction: AnimatedCardDirection.right,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: SocialLoginButton(
                    text: 'Conecte-se via Facebook',
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                    ),
                    cor: AppColors.facebookColor,
                    onTap: () => controller.facebookLogin(context),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
