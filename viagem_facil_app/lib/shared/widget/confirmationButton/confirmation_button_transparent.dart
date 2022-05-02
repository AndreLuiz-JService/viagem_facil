import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class ConfirmationButtonTransparent extends StatelessWidget {
  const ConfirmationButtonTransparent({
    Key? key,
    this.porcentagem,
    this.width,
    this.height,
    required this.onTap,
    required this.text,
    this.size,
    
  }) : super(key: key);
  final VoidCallback onTap;
  final Size? size;
  final double? porcentagem;
  final double? width;
  final double? height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary.withOpacity(0.2),
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: size == null ? width! : size!.width * porcentagem!,
        height: 40,
        alignment: Alignment.center,
        
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: AppTextStyles.textPurple16px,
        ),
      ),
    );
  }
}