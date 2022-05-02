import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/shared/models/grid_view_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';

class ItemSelecionadoPage extends StatelessWidget {
  const ItemSelecionadoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as GridViewModel;
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
                  icon: Icon(CupertinoIcons.back),
                ),
                Text(
                  item.title!,
                  style: AppTextStyles.titleBlack,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(71),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(item.imagem!,width: double.infinity,scale: 0.5,),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    child: Text(
                      'Separamos para você documentos e itens que achamos essenciais para a sua viagem',
                      style: AppTextStyles.textBlack20px,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Obrigatorio:',
                        style: AppTextStyles.textBlack18px,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 36,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.textObrigatorio!,
                        style: AppTextStyles.textBlack16pxw400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20, bottom: 9),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nossas sugestões:',
                        style: AppTextStyles.textBlack18px,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 36,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.textSugestao!,
                        style: AppTextStyles.textBlack16pxw400,
                      ),
                    ),
                  ),
                  SizedBox(height: 76,)
                ],
              ),
            ),
          ),
          Positioned(bottom: 0, child: BarraInferior(2))
        ],
      ),
    );
  }
}
