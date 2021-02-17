import 'package:flutter/material.dart';
import 'package:flutter_hands_on/my_home_page.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String _title = "";
  IconData _icon;

  bool _isError = false;

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _pickIcon() async {
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
                controller: _controller,
                onChanged: (String text) => _title = text,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _icon != null
                          ? Icon(
                              _icon,
                              size: 45.0,
                            )
                          : Text("none"),
                    ),
                    Spacer(),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Pick Icon"),
                        onPressed: () => _pickIcon(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  child: const Text("Add"),
                  onPressed: () {
                    _controller.clear();
                    if (_title == "" || _icon == null) {
                      setState(() {
                        _isError = true;
                      });
                      return;
                    }
                    Navigator.pop(context, Todo(_title, _icon));
                  },
                ),
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
