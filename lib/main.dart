// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(AttGora());
}

class AttGora extends StatelessWidget {
  const AttGora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

//to do: dela upp & fixa stateful/interactive
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _lista(),
      floatingActionButton: _fab(),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
        centerTitle: true,
        title: const Text('To-Do List'),
        backgroundColor: Colors.grey[900],
        actions: const [
          Icon(
            Icons.menu_rounded,
            color: Colors.white,
            size: 24.0,
          )
        ]);
  }

//to do: gör om till containers - build(body:container(child(row(children[expand(child:container) etc etc
  Widget _lista() {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text('Vattna blommor',
                style: TextStyle(decoration: TextDecoration.lineThrough)),
            trailing: Wrap(
              spacing: 36,
              children: const [
                Icon(Icons.check_box_rounded),
                Icon(Icons.delete_forever_rounded),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Rasta hund'),
            trailing: Wrap(
              spacing: 36,
              children: const [
                Icon(Icons.check_box_outline_blank_rounded),
                Icon(Icons.delete_forever_rounded),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Vattna hund'),
            trailing: Wrap(
              spacing: 36,
              children: const [
                Icon(Icons.check_box_outline_blank_rounded),
                Icon(Icons.delete_forever_rounded),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Göra färdigt listan'),
            trailing: Wrap(
              spacing: 36,
              children: const [
                Icon(Icons.check_box_outline_blank_rounded),
                Icon(Icons.delete_forever_rounded),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Köpa hund',
                style: TextStyle(decoration: TextDecoration.lineThrough)),
            trailing: Wrap(
              spacing: 36,
              children: const [
                Icon(Icons.check_box_rounded),
                Icon(Icons.delete_forever_rounded),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Ge upp på plugget'),
            trailing: Wrap(
              spacing: 36,
              children: const [
                Icon(Icons.check_box_outline_blank_rounded),
                Icon(Icons.delete_forever_rounded),
              ],
            ),
          ),
        ),
      ],
    );
  }

//to do: inaktiv/null
  Widget _fab() {
    return FloatingActionButton(
      onPressed: null,
      child: Icon(Icons.add),
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    );
  }
}
