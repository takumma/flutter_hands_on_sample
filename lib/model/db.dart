import 'package:hive/hive.dart';

part 'db.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  List<String> todoItems;

  TodoModel(this.todoItems);
}
