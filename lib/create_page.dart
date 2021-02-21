import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  String _title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create TODO"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("TODOを入力してください"),
            TextField(
              onChanged: (String text) => _title = text,
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () => Navigator.pop(context, _title),
            ),
          ],
        ),
      ),
    );
  }
}
