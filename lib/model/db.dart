import 'package:hive/hive.dart';

part 'db.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String title;

  TodoModel(this.title);
}

class TodoModelRepository {
  Future<Box<TodoModel>> _box = Hive.openBox<TodoModel>('todoBox');

  void save(title) async {
    Box<TodoModel> box = await _box;
    await box.add(TodoModel(title));
  }

  Future<Map<dynamic, TodoModel>> fetch() async {
    Box<TodoModel> box = await _box;
    Map<dynamic, TodoModel> todoItems = box.toMap();
    return todoItems;
  }

  Future<void> delete(key) async {
    Box<TodoModel> box = await _box;
    await box.delete(key);
  }
}
