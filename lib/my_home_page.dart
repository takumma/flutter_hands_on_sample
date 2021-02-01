import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> todoItems = [
    "英語の課題",
    "牛乳を買う",
    "Flutterの環境構築をする",
  ];

  void _addTodo() {
    setState(() {
      todoItems.add("新しいタスク");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return _todoItem(todoItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Increment',
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
}
