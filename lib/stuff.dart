// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';

class TodoListTile {
  TodoListTile({this.id = '', required this.title, this.done = false});
  String id;
  String title;
  bool done;

  static Map<String, dynamic> toJson(TodoListTile tile) {
    return {
      'id': tile.id,
      'title': tile.title,
      'done': tile.done,
    };
  }

  static TodoListTile fromJson(Map<String, dynamic> json) {
    return TodoListTile(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }

  void trueDone(TodoListTile tile) {
    done = !done;
  }
}

//////////////////////////////////////////////////////////////
class MyState extends ChangeNotifier {
  List<TodoListTile> _list = [];
  String _filterBy = 'all';

  List<TodoListTile> get list => _list;
  String get filterBy => _filterBy;

  Future getList() async {
    List<TodoListTile> list = await Api.getTiles();
    _list = list;
    notifyListeners();
  }

  void trueTile(TodoListTile tile, id) async {
    tile.trueDone(tile);
    //  _list = await Api.editTile(tile, id);  - har fuckat upp något här
    // crashar när checkbox-värde ändras.
    notifyListeners();
  }

  void addTile(TodoListTile tile) async {
    _list = await Api.addTile(tile);
    notifyListeners();
  }

  void removeTile(TodoListTile tile) async {
    _list = await Api.deleteTile(tile.id);
    notifyListeners();
  }

  void setFilterBy(var filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}

//////////////////////////////////////////////////////////////
class TodoList extends StatelessWidget {
  final List<TodoListTile> list;

  TodoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((tile) => _listItem(tile, context)).toList());
  }

  Widget _listItem(tile, context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(tile.title),
      secondary: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTile(tile);
        },
      ),
      value: tile.done,
      onChanged: (value) {
        var state = Provider.of<MyState>(context, listen: false);
        state.trueTile(tile, context);
      },
    );
  }
}
