import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

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

openUrl({required String message, required BuildContext context}) async {
  try {
    if (!message.startsWith('http://') && !message.startsWith('https://')) {
      message = 'https://$message'; // Prepend https:// if missing
    }
    await launchUrl(Uri.parse(message));
  } catch (e) {
    snackBar(
        context: context,
        message: 'Could not launch $message',
        color: Colorutils.black);
  }
}

hSpace(double size) {
  return SizedBox(
    height: size,
  );
}

wSpace(double size) {
  return SizedBox(
    width: size,
  );
}
