import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/num_extensions.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  const TextFormFieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.prefixText,
    this.keyboardType = TextInputType.text ,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final String? prefixText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium14,
        ),
        AppSpacing.lgMd.vGap,
        TextFormField(
          autofocus: false,
          controller: controller,
          cursorColor: Palette.black,
          cursorWidth: 1,
          cursorHeight: 15,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixText: prefixText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }
}
