import 'package:hive/hive.dart';

part 'db.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String title;

  TodoModel(this.title);
}

class TodoModelRepository {
  Future<Box> _box = Hive.openBox<TodoModel>('todoBox');

  void save(title) async {
    Box box = await _box;
    await box.add(TodoModel(title));
  }

  Future<List<String>> fetch() async {
    Box box = await _box;
    List<TodoModel> modelList = box.values.toList();
    List<String> todoItems = modelList.map((todo) => todo.title).toList();
    return todoItems;
  }

  Future<void> delete(title) async {
    Box box = await _box;
  }
}
