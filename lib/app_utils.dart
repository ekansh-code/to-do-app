import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constant/enums.dart';

void logger({String? tag = '', required String msg}) {
  debugPrint('''
              ˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝ $tag  ˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝˝
              |««««««««««««««««««««««««««««««««««««««««««««««|
              |  $msg
              |«««««««««««««««««««««««««««««««««««««««««««««««|
  
  ''');
}

void displaySnackBar(SnackBarMessageType snackBarMessageType,
    {required String message, int? durationInMs}) {
  final String title = snackBarMessageType == SnackBarMessageType.success
      ? 'Success'
      : snackBarMessageType == SnackBarMessageType.warning
          ? 'Warning'
          : snackBarMessageType == SnackBarMessageType.info
              ? 'Information'
              : 'Error';
  final Icon icon = snackBarMessageType == SnackBarMessageType.success
      ? const Icon(Icons.done_outline_sharp)
      : snackBarMessageType == SnackBarMessageType.warning
          ? const Icon(Icons.warning_amber_sharp)
          : snackBarMessageType == SnackBarMessageType.info
              ? const Icon(Icons.info_outline_rounded)
              : const Icon(Icons.error_outline_sharp);

  final Color bgColor = snackBarMessageType == SnackBarMessageType.success
      ? Colors.greenAccent
      : snackBarMessageType == SnackBarMessageType.warning
          ? Colors.amber
          : snackBarMessageType == SnackBarMessageType.info
              ? Colors.lightBlueAccent
              : Colors.redAccent;
  Get.snackbar(
    title,
    message,
    backgroundColor: bgColor,
    snackPosition: SnackPosition.BOTTOM,
    icon: icon,
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(16.0),
    duration: Duration(milliseconds: durationInMs ?? 2000),
  );
}

TaskListEnum dayDifference({required DateTime date1}) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final DateTime date2 = DateTime.now();

  final String formattedDate1 = formatter.format(date1);
  final String formattedDate2 = formatter.format(date2);

  if (formattedDate1 != formattedDate2) {
    if (date1.difference(date2).inHours.abs() < 24) {
      return TaskListEnum.tomorrow;
    } else {
      return TaskListEnum.upcoming;
    }
  } else {
    return TaskListEnum.today;
  }
}
