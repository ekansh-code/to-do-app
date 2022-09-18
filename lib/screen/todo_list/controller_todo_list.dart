import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_utils.dart';
import 'package:todo_app/common/model/task_db.dart';
import 'package:todo_app/constant/app_route.dart';
import 'package:todo_app/constant/enums.dart';
import 'package:todo_app/database/db_helper.dart';

class TaskListController extends GetxController {
  RxString appBarTitle = 'TaskList'.obs;
  TaskListEnum? taskListEnum;
  var todoModelList = <ToDoTaskModel>[].obs;
  var todoFilterList = <ToDoTaskModel>[].obs;
  var todoSearchList = <ToDoTaskModel>[].obs;
  RxBool isSearch = false.obs;
  final TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() async {
    var argument = await Get.arguments;
    taskListEnum = argument;
    appBarTitle.value = taskListEnum!.name.toString().toUpperCase();
    await fetchToDoList();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  Future<void> fetchToDoList() async {
    var fetchList = await DBHelper.getAllTask();
    if (fetchList != null) {
      todoModelList.value = fetchList;
      update();
      var fList = todoModelList
          .where((element) => taskListEnum == dayDifference(date1: element.taskDate!))
          .toList();
      todoFilterList.value = fList;
      logger(msg: todoFilterList.length.toString(), tag: 'Filter List Length');
    } else {
      displaySnackBar(SnackBarMessageType.error, message: 'Something went wrong');
    }
  }

  Future<void> deleteToDo(ToDoTaskModel toDoTaskModel) async {
    int index = todoModelList.indexOf(toDoTaskModel);
    todoFilterList.removeAt(todoFilterList.indexOf(toDoTaskModel));
    update();
    bool isDeleted = await DBHelper.deleteTask(index);
    if (isDeleted) {
      displaySnackBar(SnackBarMessageType.success, message: 'ToDo Deleted Successfully');
    } else {
      displaySnackBar(SnackBarMessageType.error, message: 'Something went wrong');
    }
  }

  void updateToDo(ToDoTaskModel toDoTaskModel) {
    int index = todoModelList.indexOf(toDoTaskModel);
    Get.toNamed(AppRoutes.addTodoPage, arguments: [toDoTaskModel, index]);
  }

  void searchToDo(String query) {
    todoSearchList.value = todoFilterList.where((todo) {
      final taskTitle = todo.taskTitle ?? '';
      return taskTitle.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void cancelSearch(BuildContext context) {
    isSearch.value = false;
    searchTextController.clear();
    FocusScope.of(context).unfocus();
  }
}
