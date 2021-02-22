import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String _title = "";

  IconData _icon;

  void _pickIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(context);
    setState(() {
      _icon = icon;
    });
  }

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
            Icon(
              _icon,
              size: 45.0,
            ),
            ElevatedButton(
              child: Text("Pick Icon"),
              onPressed: () => _pickIcon(),
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
