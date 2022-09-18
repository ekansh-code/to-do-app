import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/common/model/task_db.dart';
import 'package:todo_app/constant/app_route.dart';
import 'package:todo_app/constant/hive_box.dart';
import 'package:todo_app/resources/themes/global_app_theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoTaskModelAdapter());
  await Hive.openBox<ToDoTaskModel>(HiveDbBox.dbToDoBox);
  await Hive.openBox(HiveDbBox.lastToDoIndexBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: GlobalAppTheme.appThemeData,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.homePage,
    );
  }
}
