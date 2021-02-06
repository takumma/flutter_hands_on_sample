import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _controller;

  List<String> _todoItems = [
    "英語の課題",
    "牛乳を買う",
    "Flutterの環境構築をする",
  ];

  void _addTodo(String title) {
    setState(() {
      _todoItems.add(title);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
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
        onPressed: () {
          showFormDialog(context);
        },
        tooltip: 'add todo',
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
        title: Text(
          title,
        ),
      ),
    );
  }

  void showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("新しいTODOを追加"),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("TODOを入力してください"),
              TextField(),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text("Add"),
            onPressed: () {
              _addTodo("ダイアログからのTODO");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
