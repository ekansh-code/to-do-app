import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/model/task_db.dart';
import 'package:todo_app/database/db_helper.dart';

class HomeController extends GetxController {
  List<dynamic>? toDoTaskModel;

  @override
  void onReady() {
    fetchLatestToDo();
    super.onReady();
  }

  Future<void> fetchLatestToDo() async {
    Future.delayed(Duration(seconds: 1));
    toDoTaskModel = await DBHelper.fetchLatestToDo();
    if (toDoTaskModel != null) {
      showAlert(Get.context!);
    }
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text(toDoTaskModel?[0] ?? 'taskDescription'),
                content: Text(toDoTaskModel?[1] ?? 'taskDescription'),
                actions: [
                  ElevatedButton(
                      onPressed: () => {Get.back(closeOverlays: true)}, child: const Text('Ok'))
                ]));
  }
}
