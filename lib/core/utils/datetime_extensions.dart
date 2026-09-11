extension DatetimeExtensions on DateTime {
  bool isSameDayAs(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}
