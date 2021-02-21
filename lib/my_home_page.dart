import 'package:flutter/material.dart';

import 'create_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _todoItems = [
    "英語の課題",
    "牛乳を買う",
  ];

  void _addTodo(String title) {
    setState(() {
      _todoItems.add(title);
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
          return Card(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.red),
              ),
              child: ListTile(
                title: Text(_todoItems[index]),
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(_todoItems[index]),
                      actions: [
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String title = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          if (title != null && title != "") _addTodo(title);
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
