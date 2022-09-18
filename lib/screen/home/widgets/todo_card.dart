import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/app_route.dart';
import 'package:todo_app/constant/enums.dart';
import 'package:todo_app/resources/themes/text_theme.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({super.key, required this.taskListEnum, required this.textButtonText});
  final TaskListEnum taskListEnum;
  final String textButtonText;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shadowColor: Colors.tealAccent,
      color: Colors.teal[700],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () => Get.toNamed(AppRoutes.taskListPage,
                  arguments: taskListEnum),
              child: Center(
                child: Text(
                  textButtonText,
                  style: headLine1.copyWith(color: Colors.yellow),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => Get.toNamed(AppRoutes.addTodoPage,
                  arguments: taskListEnum.name),
              child: const Card(
                  elevation: 8.0, shadowColor: Colors.teal, child: Icon(Icons.add_task_outlined)),
            ),
          ),
        ],
      ),
    );
  }
}
