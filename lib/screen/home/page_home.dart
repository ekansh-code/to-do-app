import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/enums.dart';
import 'package:todo_app/screen/home/controller_home.dart';
import 'package:todo_app/screen/home/widgets/todo_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
              children: const [
                Expanded(
                  child: ToDoCard(
                    taskListEnum: TaskListEnum.today,
                    textButtonText: "Today",
                  ),
                ),
                Expanded(
                  child: ToDoCard(
                    taskListEnum: TaskListEnum.tomorrow,
                    textButtonText: "Tomorrow",
                  ),
                ),
                Expanded(
                  child: ToDoCard(
                    taskListEnum: TaskListEnum.upcoming,
                    textButtonText: "Upcoming",
                  ),
                ),
              ],
            ),
    );
  }
}

