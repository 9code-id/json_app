extension DateStringExtension on String {
  //from 20/2/1932 String to DateTime
  DateTime toDate() {
    var date = split("/");
    return DateTime(int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
  }

  String get dMy {
    var date = toDate();
    return "${date.day}/${date.month}/${date.year}";
  }
}

extension StringDateExtension on DateTime {
  String get dMy {
    return "$day/$month/$year";
  }
}
