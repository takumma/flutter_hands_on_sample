import 'package:flutter/material.dart';
import 'package:flutter_hands_on/create_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Todo {
  String title;
  IconData icon;

  Todo(this.title, this.icon);
}

class _MyHomePageState extends State<MyHomePage> {

  List<Todo> _todoItems = [
    Todo("英語の課題", Icons.description),
    Todo("牛乳を買う", Icons.local_grocery_store),
  ];

  void _addTodo(String title, IconData icon) {
    setState(() {
      _todoItems.add(Todo(title, icon));
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _todoItems.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return _todoItem(_todoItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo todo = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          if (todo != null && todo.title != "") _addTodo(todo.title, todo.icon);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _todoItem(Todo todo) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.red),
        ),
        child: ListTile(
          leading: Icon(
            todo.icon,
            size: 35.0,
          ),
          title: Text(todo.title),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => _showDetailDialog(context, todo),
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Todo todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(todo.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              _deleteTodo(todo);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
