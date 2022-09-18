// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoTaskModelAdapter extends TypeAdapter<ToDoTaskModel> {
  @override
  final int typeId = 0;

  @override
  ToDoTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoTaskModel(
      id: fields[0] as int?,
      taskTitle: fields[1] as String?,
      taskDescription: fields[2] as String?,
      taskDate: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoTaskModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taskTitle)
      ..writeByte(2)
      ..write(obj.taskDescription)
      ..writeByte(3)
      ..write(obj.taskDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
