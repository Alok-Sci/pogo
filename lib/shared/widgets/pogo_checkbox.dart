import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/utils/double_extensions.dart';

class PogoCheckBox extends StatelessWidget {
  const PogoCheckBox({
    required this.value,
    super.key,
  });
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: value ? Palette.green : Colors.transparent,
          border: Border.all(
            color: Palette.green,
          ),
          borderRadius: AppRadii.full.circular,
        ),
        child: value
            ? Icon(
                Icons.check,
                color: Palette.white,
                size: 16,
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
