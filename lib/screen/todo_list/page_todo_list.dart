import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/resources/themes/text_theme.dart';
import 'package:todo_app/screen/todo_list/controller_todo_list.dart';
import 'package:todo_app/screen/todo_list/search_todo.dart';

class ToDoListPage extends StatelessWidget {
  ToDoListPage({super.key});

  final TaskListController _taskListController = Get.put(TaskListController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(_taskListController.appBarTitle.value),
          ),
        ),
        body: Obx(
          () => _taskListController.todoFilterList.isEmpty
              ? Center(
                  child: Text('No Task Found', style: headLine1),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          Visibility(
                            visible: _taskListController.isSearch.value,
                            child: IconButton(
                              onPressed: () => _taskListController.cancelSearch(context),
                              icon: const Icon(Icons.close),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _taskListController.searchTextController,
                              onTap: () => _taskListController.isSearch.value = true,
                              onChanged: (value) => _taskListController.searchToDo(value),
                              cursorColor: Colors.teal,
                              decoration: InputDecoration(
                                hintText: 'Search Based on Title',
                                filled: true,
                                fillColor: Colors.teal[50],
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: TodoListView(
                            toDoList: _taskListController.isSearch.value
                                ? _taskListController.todoSearchList
                                : _taskListController.todoFilterList))
                  ],
                ),
        ),
      ),
    );
  }
}
