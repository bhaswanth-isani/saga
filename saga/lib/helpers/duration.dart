/// Extension on top of num values to convert them into Duration.
extension DurationExtensions on num {
  /// Converts number to Duration in microseconds.
  Duration get microseconds => Duration(microseconds: round());

  /// Converts number to Duration in milliseconds.
  Duration get milliseconds => (this * 1000).microseconds;

  /// Converts number to Duration in seconds.
  Duration get seconds => (this * 1000 * 1000).microseconds;

  /// Converts number to Duration in minutes.
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  /// Converts number to Duration in hours.
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Converts number to Duration in days.
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}
