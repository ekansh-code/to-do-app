import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/widgets/text_form_field.dart';
import 'package:todo_app/resources/themes/text_theme.dart';
import 'package:todo_app/screen/add_todo_task/controller_add_todo.dart';
import 'package:todo_app/screen/todo_list/controller_todo_list.dart';

class AddToDoPage extends StatelessWidget {
  AddToDoPage({super.key});
  final AddToDoController _addToDoController = Get.put(AddToDoController());
  final TaskListController tlc = Get.put(TaskListController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add To Do'),
          leading: IconButton(
            onPressed: () => {
              {tlc.fetchToDoList(), Get.back()}
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                      labelText: 'Title',
                      textEditingController: _addToDoController.titleTextController),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                      labelText: 'Description',
                      textEditingController: _addToDoController.decTextController,
                      isRequired: false),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(
                        () => Text(_addToDoController.selectedDate.value.split(" ").first,
                            style: headLine1),
                      ),
                      IconButton(
                          onPressed: () async => await _addToDoController.selectDate(context),
                          icon: const Icon(Icons.calendar_month)),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        await _addToDoController.addTask();
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
