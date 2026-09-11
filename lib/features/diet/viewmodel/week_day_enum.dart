import 'package:pogo/core/utils/string_extensions.dart';

enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sundary;

  String get title => name.capitalize;
}
