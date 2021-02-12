import 'package:flutter/material.dart';
import 'package:flutter_hands_on/create_page.dart';
import 'package:flutter_hands_on/model/db.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;

  TodoModelRepository _repository = TodoModelRepository();

  Map<dynamic, TodoModel> _todoItems;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _fetchTodoItems();
  }

  Future<void> _fetchTodoItems() async {
    _todoItems = await _repository.fetch();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTodo(String title) {
    setState(() {
      _repository.save(title);
      _fetchTodoItems();
    });
  }

  void _deleteTodo(key) {
    setState(() {
      _todoItems.remove(key);
      _repository.delete(key);
      _fetchTodoItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _todoItems?.length == null
          ? Container()
          : ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (BuildContext context, int index) {
                int key = _todoItems.keys.elementAt(index);
                return _todoItem(key, _todoItems[key]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String title = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          if (title != null && title != "") _addTodo(title);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _todoItem(int key, TodoModel todo) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.red),
        ),
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(fontSize: 20.0),
          ),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => _showDetailDialog(context, key, todo),
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, int key, TodoModel todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(todo.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              _deleteTodo(key);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
