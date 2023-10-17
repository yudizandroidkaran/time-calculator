//Class to better handle dates in the project
class DateUtil {

  //Returns current date in formatted form
  String getCurrentDate() {
    DateTime now = DateTime.now();
    return "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}";
  }

  String getCurrentDateWithBackSlash() {
    DateTime now = DateTime.now();
    return "${_twoDigits(now.month)}/${_twoDigits(now.day)}/${now.year}";
  }

  //Returns current time in formatted form
  String getCurrentTime() {
    DateTime now = DateTime.now();
    return '${_twoDigits(now.hour)}:${_twoDigits(now.minute)}:${_twoDigits(now.second)}';
  }

  //Adds 0 before number if number is not already 2 digits
  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  //Returns a year from given date
  String getYearFromDate(String date) {
    return date.substring(0, 4);
  }

  static String getDate(String dateTime) {
    return "${DateTime.parse(dateTime).toLocal().month.toString().padLeft(2, '0')}/${DateTime.parse(dateTime).toLocal().day.toString().padLeft(2, '0')}/${DateTime.parse(dateTime).toLocal().year.toString()}";
  }

  static String getDateServer(String dateTime) {
    return "${DateTime.parse(dateTime).toLocal().month.toString().padLeft(2, '0')}-"
        "${DateTime.parse(dateTime).toLocal().day.toString().padLeft(2, '0')}-"
        "${DateTime.parse(dateTime).toLocal().year.toString()}";
  }

  static String getDateForCID(String dateTime) {
    return "${DateTime.parse(dateTime).toLocal().year.toString().padLeft(2, '0')}-${DateTime.parse(dateTime).toLocal().month.toString().padLeft(2, '0')}-${DateTime.parse(dateTime).toLocal().day.toString()}";
  }

  static String getTime(String dateTime) {
    return "${DateTime.parse(dateTime).toLocal().hour.toString().padLeft(2, '0')}:${DateTime.parse(dateTime).toLocal().minute.toString().padLeft(2, '0')}";
  }
}
