extension DateTimeExtension on DateTime {
  bool isSameDayAs(DateTime time) =>
      this.year == time.year && this.month == time.month && this.day == time.day;
}
