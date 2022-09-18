import 'package:hive/hive.dart';
import 'package:todo_app/common/model/task_db.dart';
import 'package:todo_app/constant/hive_box.dart';
import 'package:todo_app/app_utils.dart';

class DBHelper {
  DBHelper._();

  static Future<int?>? addTask(ToDoTaskModel todoTaskModel) async {
    try {
      Box<ToDoTaskModel> todoBox = Hive.box<ToDoTaskModel>(HiveDbBox.dbToDoBox);
      var lastToDoIndexBox=  Hive.box(HiveDbBox.lastToDoIndexBox);
      int index = await todoBox.add(todoTaskModel);
      await lastToDoIndexBox.put('lUR', [todoTaskModel.taskTitle,todoTaskModel.taskDescription]);
      return index;
    } catch (e) {
      logger(tag: 'addTask', msg: 'Error: $e');
    }
    return null;
  }

  static Future<bool> updateTask(int index, ToDoTaskModel todoTaskModel) async {
    Box<ToDoTaskModel> todoBox = Hive.box<ToDoTaskModel>(HiveDbBox.dbToDoBox);
    var lastToDoIndexBox=  Hive.box(HiveDbBox.lastToDoIndexBox);
    try {
      await todoBox.putAt(index, todoTaskModel);
      await lastToDoIndexBox.put('lUR', [todoTaskModel.taskTitle,todoTaskModel.taskDescription]);
      return true;
    } catch (e) {
      logger(tag: 'updateTask', msg: 'Error: $e');
      return false;
    }
  }

  static Future<bool> deleteTask(int index) async {
    Box<ToDoTaskModel> todoBox = Hive.box<ToDoTaskModel>(HiveDbBox.dbToDoBox);
    try {
      await todoBox.deleteAt(index);
      return true;
    } catch (e) {
      logger(tag: 'deleteTask', msg: 'Error: $e');
      return false;
    }
  }

  static Future<List<ToDoTaskModel>?> getAllTask() async {
    Box<ToDoTaskModel> todoBox = Hive.box<ToDoTaskModel>(HiveDbBox.dbToDoBox);
    try {
      List<ToDoTaskModel> result = todoBox.values.toList();
      logger(msg: result.length.toString(), tag: 'All To Do');

      return result;
    } catch (e) {
      logger(tag: 'getTask', msg: 'Error: $e');
    }
    return null;
  }

  static Future<List<dynamic>?> fetchLatestToDo() async {
    var lastToDoIndexBox=  Hive.box(HiveDbBox.lastToDoIndexBox);
    try {
      var result = lastToDoIndexBox.get('lUR');
      return result;
    } catch (e) {
      logger(tag: 'getTask', msg: 'Error: $e');
    }
    return null;
  }
}
