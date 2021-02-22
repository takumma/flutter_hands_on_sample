import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import 'my_home_page.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String _title = "";

  IconData _icon;

  bool _isError = false;

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
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "TODO title",
                ),
                onChanged: (String text) => _title = text,
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _icon != null
                        ? Icon(
                            _icon,
                            size: 45.0,
                          )
                        : Text("none"),
                    ElevatedButton(
                      child: const Text("Pick Icon"),
                      onPressed: () => _pickIcon(),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  if (_title == "" || _icon == null) {
                    setState(() {
                      _isError = true;
                    });
                    return;
                  }
                  Navigator.pop(context, Todo(_title, _icon));
                },
              ),
              if (_isError)
                Text(
                  "全ての項目を埋めてください",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
