extension DatetimeExtensions on DateTime {
  bool isSameDayAs(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  // 14th April 2025 (not current year)
  // 14th January (for current year)
  String get formattedDateString =>
      "$dayWithSuffix $monthName ${year != DateTime.now().year ? year : ""}";

  String get monthName => switch (month) {
        1 => "January",
        2 => "February",
        3 => "March",
        4 => "April",
        5 => "May",
        6 => "June",
        7 => "July",
        8 => "August",
        9 => "September",
        10 => "October",
        11 => "November",
        12 => "December",
        _ => "",
      };

  String get weekdayName => switch (weekday) {
        1 => "Monday",
        2 => "Tuesday",
        3 => "Wednesday",
        4 => "Thursday",
        5 => "Friday",
        6 => "Saturday",
        7 => "Sunday",
        _ => "",
      };

  String get dayWithSuffix {
    final suffix = switch (day) {
      1 || 21 || 31 => "st",
      2 || 22 => "nd",
      3 || 23 => "rd",
      _ => "th",
    };
    return "$day$suffix";
  }
}
