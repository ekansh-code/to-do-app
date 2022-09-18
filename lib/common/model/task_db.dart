import 'package:hive/hive.dart';
part 'task_db.g.dart';

@HiveType(typeId: 0)
class ToDoTaskModel extends HiveObject{
  @HiveField(0)
  int?id;

  @HiveField(1)
  String? taskTitle;

  @HiveField(2)
  String? taskDescription = '';

  @HiveField(3)
  DateTime? taskDate;

  ToDoTaskModel(
      {this.id,required this.taskTitle, this.taskDescription, required this.taskDate});

}
