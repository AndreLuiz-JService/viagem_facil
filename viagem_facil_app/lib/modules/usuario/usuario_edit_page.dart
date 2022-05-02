import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/usuario/usuario_edit_controller.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';
import 'package:viagem_facil/shared/widget/confirmationButton/confirmation_button.dart';
import 'package:viagem_facil/shared/widget/textFormWidget/text_form_widget.dart';

class UsuarioEditPage extends StatelessWidget {
  const UsuarioEditPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final usereditController = Get.put(UserEditController());
    final user = Get.put(AuhtController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            height: 71,
            alignment: Alignment.center,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(CupertinoIcons.clear),
                ),
                Text(
                  'Edit sua Conta',
                  style: AppTextStyles.titleBlack,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(71),
      ),
      body: GetBuilder<AuhtController>(
        builder: (_) => Container(
          height: size.height - 71,
          child: Stack(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      height: size.height * 0.75,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textForm, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Hero(
                                tag: 'foto perfil',
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 26),
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.bottomSheet,
                                      width: 1,
                                    ),
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                          user.user.value.photoURL!),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                user.user.value.name!,
                                style: AppTextStyles.textgrey18px,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 34),
                            child: Form(
                              key: usereditController.formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 18.0),
                                    child: TextFormWidget(
                                        label: 'Nome completo',
                                        initialValue:
                                            user.user.value.nameComplete == null
                                                ? ''
                                                : user.user.value.nameComplete!,
                                        validator: usereditController
                                            .validateNameCompleto,
                                        onChanged: (value) {
                                          usereditController.nameComplete =
                                              value;
                                        }),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 18.0),
                                    child: TextFormWidget(
                                      label: 'Nome de usuário',
                                      initialValue:
                                          user.user.value.userName == null
                                              ? ''
                                              : user.user.value.userName!,
                                      validator: usereditController
                                          .validateNameDeUsuario,
                                      onChanged: (value) {
                                        usereditController.nameUser = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 5),
                                child: Text('E-mail'),
                              ),
                              Container(
                                width: 300,
                                height: 45,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: AppColors.textForm,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    user.user.value.email!,
                                    style: AppTextStyles.textBlack14pxw400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ConfirmationButton(
                                onTap: () {
                                  if (user.user.value.nameComplete != null && usereditController.nameComplete == '') {
                                    usereditController.nameComplete = user.user.value.nameComplete;
                                  } 
                                  if (user.user.value.userName != null && usereditController.nameUser == '') {
                                    usereditController.nameUser = user.user.value.userName;
                                  } 
                                  usereditController.alterarUser(context);
                                },
                                text: 'SALVAR',
                                width: 300,
                              )),
                          Spacer(flex: 2,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: BarraInferior(5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
