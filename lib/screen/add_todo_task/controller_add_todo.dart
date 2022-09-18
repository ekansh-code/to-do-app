import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_utils.dart';
import 'package:todo_app/common/model/task_db.dart';
import 'package:todo_app/constant/enums.dart';
import 'package:todo_app/database/db_helper.dart';

class AddToDoController extends GetxController {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController decTextController = TextEditingController();
  RxString selectedDate = DateTime.now().toString().obs;
  final _argument = ''.obs;
  ToDoTaskModel? updateAbleToDo;
  int? updateAbleIndex;
  @override
  void onInit() async {
    var arg = await Get.arguments;
    if (arg is String) {
      _argument.value = arg;
      if (_argument.value == TaskListEnum.tomorrow.name) {
        selectedDate.value = DateTime.now().add(const Duration(days: 1)).toString();
      } else if (_argument.value == TaskListEnum.upcoming.name) {
        selectedDate.value = DateTime.now().add(const Duration(days: 2)).toString();
      }
    } else {
      updateAbleToDo = arg[0];
      updateAbleIndex = arg[1];
      if (updateAbleToDo != null) {
        logger(msg: 'msg');
        titleTextController.text = updateAbleToDo!.taskTitle ?? '';
        decTextController.text = updateAbleToDo!.taskDescription ?? '';
        selectedDate.value = updateAbleToDo!.taskDate.toString();
      }
    }
    super.onInit();
  }

  @override
  void dispose() {
    titleTextController.dispose();
    decTextController.dispose();
    super.dispose();
  }

  Future<void> addTask() async {
    ToDoTaskModel toDoTaskModel = ToDoTaskModel(
        taskTitle: titleTextController.text,
        taskDate: DateTime.parse(selectedDate.value),
        taskDescription: decTextController.text);
    logger(msg: toDoTaskModel.toString(), tag: 'Todo task model');

    if (updateAbleIndex != null) {
      bool isUpdated = await DBHelper.updateTask(updateAbleIndex!, toDoTaskModel);
      if (isUpdated) {
        _clearField();
        displaySnackBar(SnackBarMessageType.success, message: 'ToDo Updated Successfully');
      } else {
        displaySnackBar(SnackBarMessageType.error, message: 'Something went wrong');
      }
    } else {
      var result = DBHelper.addTask(toDoTaskModel);
      if (result != null) {
        _clearField();
        displaySnackBar(SnackBarMessageType.success, message: 'Task Added Successfully');
      } else {
        displaySnackBar(SnackBarMessageType.error, message: 'Something went wrong');
      }
    }
  }

  void _clearField(){
    titleTextController.clear();
    decTextController.clear();
    selectedDate.value = DateTime.now().toString();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(selectedDate.value),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      selectedDate.value = picked.toString();
      update();
    }
  }
}
