import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    Key? key,
    this.cor,
    this.icon,
    this.porcentagem,
    this.width,
    required this.onTap,
    required this.text,
    this.size,
  }) : super(key: key);

  final VoidCallback onTap;
  final Size? size;
  final double? porcentagem;
  final double? width;
  final String text;
  final Color? cor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size == null ? width! : size!.width * porcentagem!,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cor == null ? AppColors.primary : cor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null ? SizedBox() : icon!,
            Text(
              text,
              style: AppTextStyles.textWhite16px,
            ),
          ],
        ),
      ),
    );
  }
}
