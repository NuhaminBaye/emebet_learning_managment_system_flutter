extension StringExt on String {
  bool get isEmail => contains("@");
}

extension DateExt on DateTime {
  String get short => "$day/$month/$year";
}