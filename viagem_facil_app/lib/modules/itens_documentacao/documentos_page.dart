import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/itens_documentacao/itens_documentacao_controller.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class DocumentosPage extends StatelessWidget {
  const DocumentosPage({Key? key, required this.controller}) : super(key: key);
  final ItensEDocumentacaoController controller;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItensEDocumentacaoController());
    return Expanded(
        child: GridView.count(
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      padding: EdgeInsets.all(30),
      children: controller.gridViewDocumentos
          .map(
            (e) => Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () => Get.toNamed(RotasApp.ITENSDOCUMENTACAOSelecionado,arguments: e),
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(color: e.cor2),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Center(
                            child: ClipRect(
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                  color: e.cor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Image.asset(e.icon),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 28,
                          left: 13,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Viagens',
                                style: AppTextStyles.textWhite14pxw400,
                              ),
                              Text(
                                e.text2!,
                                style: AppTextStyles.textWhite18px,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.text,
                                style: AppTextStyles.textWhite14pxw500,
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ));
  }
}
