// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'stuff.dart';

class SecondView extends StatefulWidget {
  final TodoListTile tile;
  const SecondView(this.tile, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SecondViewState(tile);
  }
}

class _SecondViewState extends State<SecondView> {
  late String text;
  late TextEditingController textEditingController;

  _SecondViewState(TodoListTile tile) {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      setState(() {
        text = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
          backgroundColor: Colors.grey[900],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(24.0),
              child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: "What are you going to do?",
                      border: OutlineInputBorder()),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            ElevatedButton(
              child: Icon(
                Icons.add_task_outlined,
                size: 48,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade900)),
              onPressed: () {
                Navigator.pop(
                  context,
                  TodoListTile(text: text, checked: false),
                );
              },
            )
          ],
        ));
  }
}
