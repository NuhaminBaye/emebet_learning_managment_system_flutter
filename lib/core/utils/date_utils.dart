calculateDifference(String startTime, String endTime) {
  // Parse the time strings into DateTime objects
  DateTime startDateTime = DateTime.parse("2000-01-01 $startTime");
  DateTime endDateTime = DateTime.parse("2000-01-01 $endTime");

  // Calculate the difference
  Duration difference = endDateTime.difference(startDateTime);

  // Get the difference in minutes
  int differenceInMinutes = difference.inMinutes;

  return differenceInMinutes.toString();
}

String convertTo12Hour(String time24) {
  // Split the time into hours and minutes
  List<String> parts = time24.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  // Determine the period (AM/PM)
  String period = hours < 12 ? 'AM' : 'PM';

  // Convert hours to 12-hour format
  hours = hours % 12;
  hours = hours == 0 ? 12 : hours;

  // Format the time in 12-hour format
  String minutesFormatted = minutes.toString().padLeft(2, '0');
  String time12 = '$hours:$minutesFormatted $period';

  return time12;
}
