import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/malas_prontas/mala_selecionada_controller.dart';
import 'package:viagem_facil/shared/models/itens_model.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class ItemListMalaSelecionada extends StatelessWidget {
  const ItemListMalaSelecionada({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);
  final ItensModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    final malasController = Get.put(MalaSelecionadaController());
    return Container(
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: malasController.excluirIsSelect.value
                ? item.select == true
                    ? AppColors.vermelhoDesaturado
                    : Colors.transparent
                : Colors.transparent,
          ),
          color: malasController.excluirIsSelect.value
              ? item.select == true
                  ? AppColors.vermelhoDesaturado.withOpacity(0.1)
                  : AppColors.greyMalas.withOpacity(0.3)
              : AppColors.greyMalas.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await malasController.selecionarItem(
                        index, item.select, item);
                  },
                  child: Container(
                    width: 27,
                    height: 27,
                    child: item.select == true
                        ? malasController.excluirIsSelect.value
                            ? Icon(
                                Icons.check,
                                size: 22,
                                color: AppColors.vermelhoDesaturado,
                              )
                            : Icon(
                                Icons.check,
                                size: 22,
                                color: AppColors.roxoStrong,
                              )
                        : SizedBox(),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: item.select == true ? 2 : 1,
                          color: item.select == true
                              ? malasController.excluirIsSelect.value
                                  ? AppColors.vermelhoDesaturado
                                  : AppColors.borderBlack
                              : AppColors.borderBlack.withOpacity(0.6),
                        ),
                        borderRadius: item.select == true
                            ? BorderRadius.circular(2)
                            : BorderRadius.circular(5)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    item.nome!,
                    style: AppTextStyles.textBlack12px400w,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                malasController.addPublicacao(item,context);
              },
              child: Container(
                width: 150,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Adicionar ao ranking',
                  style: AppTextStyles.textWhite12px,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
