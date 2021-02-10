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

  Future<List<TodoModel>> fetch() async {
    Box box = await _box;
    List<TodoModel> todoItems = box.values.toList();
    return todoItems;
  }
}
