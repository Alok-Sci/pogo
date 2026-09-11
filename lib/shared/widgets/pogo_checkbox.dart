import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/utils/double_extensions.dart';

class PogoCheckBox extends StatelessWidget {
  const PogoCheckBox({
    required this.value,
    this.color = Palette.green,
    super.key,
  }) : _shape = const RoundedRectangleBorder();

  const PogoCheckBox._circle({
    required this.value,
    required this.color,
  }) : _shape = null;

  final bool value;
  final Color color;
  final OutlinedBorder? _shape;

  factory PogoCheckBox.dark({required bool value}) => PogoCheckBox(
        value: value,
        color: Palette.charcoalGrey,
      );

  factory PogoCheckBox.circle({required bool value}) => PogoCheckBox._circle(
        value: value,
        color: Palette.green,
      );

  factory PogoCheckBox.circleDark({required bool value}) =>
      PogoCheckBox._circle(
        value: value,
        color: Palette.charcoalGrey,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: value ? color : Colors.transparent,
          border: Border.all(
            color: color,
          ),
          borderRadius: _shape is RoundedRectangleBorder
              ? AppRadii.s.circular
              : AppRadii.full.circular,
        ),
        child: value
            ? Icon(
                Icons.check,
                color: Palette.white,
                size: 16,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
