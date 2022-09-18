import 'package:get/get.dart';
import 'package:todo_app/screen/add_todo_task/page_add_todo.dart';
import 'package:todo_app/screen/home/page_home.dart';
import 'package:todo_app/screen/todo_list/page_todo_list.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static const homePage = '/home';
  static const taskListPage = '/taskList';
  static const addTodoPage = '/addTodo';

  static final routes = [
    GetPage(name: homePage, page: () =>  HomePage()),
    GetPage(name: taskListPage, page: () => ToDoListPage()),
    GetPage(name: addTodoPage, page: () =>  AddToDoPage()),
  ];
}
