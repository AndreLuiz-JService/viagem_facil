import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    this.senha,
    this.validator,
    this.onChanged,
    this.controller,
    this.initialValue = '',
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;
  final String initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool? senha;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0,bottom: 5),
          child: Text(label),
        ),
        Container(
          width: 300,
          height: 50,
          child: TextFormField(
            initialValue: initialValue,
            textAlign: TextAlign.left,
            validator: validator,
            onChanged: onChanged,
            style: AppTextStyles.textBlack14pxw400,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.googleColor,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primary,
              )),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primary,
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.textForm,
              )),
              
            ),
          ),
        ),
      ],
    );
  }
}
