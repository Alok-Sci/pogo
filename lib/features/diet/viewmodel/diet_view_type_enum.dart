import 'package:pogo/core/utils/string_extensions.dart';

enum DietViewType {
  weekly,
  monthly;

  String get title => "${name.capitalize} View";
}
