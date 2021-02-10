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

  List<String> _todoItems = [];

  @override
  void initState() async {
    super.initState();
    _controller = TextEditingController();
    _todoItems = await _repository.fetch();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTodo(String title) {
    setState(() {
      _todoItems.add(title);
      _repository.save(title);
    });
  }

  void _deleteTodo(String title) {
    setState(() {
      _todoItems.remove(title);
      _repository.delete(title);
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
          final String title = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          if (title != null && title != "") _addTodo(title);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _todoItem(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey),
      ),
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        title: Text(title),
        onTap: () => showDetailDialog(context, title),
      ),
    );
  }

  void showDetailDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              _deleteTodo(title);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
