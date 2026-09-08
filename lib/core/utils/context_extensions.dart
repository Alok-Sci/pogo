import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_colors_extension.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppColorsExtension get appColors => theme.extension<AppColorsExtension>()!;

  Size get screen => MediaQuery.sizeOf(this);
  double get sw => screen.width;
  double get sh => screen.height;
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

}
