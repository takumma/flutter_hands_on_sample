import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

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
        title: const Text("Create TODO"),
      ),
      body: Container(),
    );
  }

  void showFormDialog(BuildContext context) {
    String _title = "";
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("新しいTODOを追加"),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("TODOを入力してください"),
              TextField(
                controller: _controller,
                onChanged: (String text) => _title = text,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text("Add"),
            onPressed: () {
              _addTodo(_title);
              _controller.clear();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
