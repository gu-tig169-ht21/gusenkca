// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'secondview.dart';
import 'stuff.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
          backgroundColor: Colors.grey[900],
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('all'), value: 'all'),
                PopupMenuItem(child: Text('done'), value: 'done'),
                PopupMenuItem(child: Text('not done'), value: 'not done'),
              ],
            ),
          ],
        ),
        body: Consumer<MyState>(
          builder: (context, state, child) =>
              TodoList(_filterList(state.list, state.filterBy)),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Add task",
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          onPressed: () async {
            var newTile = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SecondView(TodoListTile(title: 'title', done: false))));
            if (newTile != null) {
              Provider.of<MyState>(context, listen: false).addTile(newTile);
            }
          },
        ));
  }

  List<TodoListTile> _filterList(list, filterBy) {
    if (filterBy == 'all') return list;
    if (filterBy == 'done') {
      return list.where((tile) => tile.done == true).toList();
    }
    if (filterBy == 'not done') {
      return list.where((tile) => tile.done == false).toList();
    }
    return list;
  }
}
