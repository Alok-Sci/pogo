import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_text_styles.dart';

class BodyText extends StatelessWidget {
  const BodyText(
    this.text, {
    this.color,
    super.key,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.bodyRegular14Tall.copyWith(color: color),
    );
  }
}
