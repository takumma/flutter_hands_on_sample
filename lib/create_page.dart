import 'package:flutter/material.dart';
import 'package:flutter_hands_on/my_home_page.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String _title = "";

  IconData _icon = Icons.access_alarm;

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
                      child: Icon(_icon),
                    ),
                    Spacer(),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Pick Icon"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text("Add"),
                onPressed: () {
                  _controller.clear();
                  Navigator.pop(context, Todo(_title, Icons.add));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
