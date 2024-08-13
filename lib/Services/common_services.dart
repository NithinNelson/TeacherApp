import 'package:intl/intl.dart';

String? capitalizeEachWord(String? input) {
  if (input == null || input.isEmpty) return input;

  return input
      .split(' ')
      .map((word) => word.isNotEmpty
          ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
          : '')
      .join(' ');
}

String convertDateFormat(String? inputDate) {
  if (inputDate == null) {
    return "--";
  }
  try {
    // Parse the input date string to DateTime
    DateTime dateTime = DateTime.parse(inputDate);

    // Format the DateTime to the desired format
    String formattedDate = DateFormat('MM/dd/yy').format(dateTime);

    return formattedDate;
  } catch (e) {
    return "--";
  }
}

String convertTimeFormat(String? inputDate) {
  if (inputDate == null) {
    return "--";
  }
  try {
    // Parse the input date string to DateTime
    DateTime dateTime = DateTime.parse(inputDate);

    // Format the DateTime to the desired format
    String formattedTime = DateFormat('hh:mma').format(dateTime).toUpperCase();

    return formattedTime;
  } catch (e) {
    return "--";
  }
}
