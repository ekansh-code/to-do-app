import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/model/task_db.dart';
import 'package:todo_app/resources/themes/text_theme.dart';
import 'package:todo_app/screen/todo_list/controller_todo_list.dart';

class TodoListView extends StatelessWidget {
  TodoListView({super.key,required this.toDoList});
  final List<ToDoTaskModel> toDoList;
  final TaskListController _taskListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          itemCount: toDoList.length,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(toDoList[index].taskTitle!, style: headLine1),
              subtitle: Text(toDoList[index].taskDescription ?? '',
                  style: normalText1),
              trailing: SizedBox(
                width: Get.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => _taskListController
                            .updateToDo(toDoList[index]),
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text('Delete ToDo'),
                                  content: const Text('Are you sure to delete this To Do'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _taskListController
                                            .deleteToDo(toDoList[index]);
                                        Get.back();
                                      },
                                      child: const Text('Delete'),
                                    ),
                                    OutlinedButton(
                                        onPressed: () => {Get.back()}, child: const Text('Cancel'))
                                  ]);
                            },
                          );
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ));
  }
}
