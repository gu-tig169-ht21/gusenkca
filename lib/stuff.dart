import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListTile {
  TodoListTile({required this.text, this.checked = false});
  String text;
  bool checked;

  void trueChecked(TodoListTile tile) {
    checked = !checked;
  }
}

//////////////////////////////////////////////////////////////
class MyState extends ChangeNotifier {
  final List<TodoListTile> _list = [];
  String _filterBy = 'all';

  List<TodoListTile> get list => _list;
  String get filterBy => _filterBy;

  void addTile(TodoListTile tile) {
    _list.add(tile);
    notifyListeners();
  }

  void removeTile(TodoListTile tile) {
    _list.remove(tile);
    notifyListeners();
  }

  void trueTile(TodoListTile tile) {
    tile.trueChecked(tile);
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

  const TodoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((tile) => _listItem(context, tile)).toList());
  }

  Widget _listItem(context, tile) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(tile.text),
      secondary: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTile(tile);
        },
      ),
      value: tile.checked,
      onChanged: (value) {
        var state = Provider.of<MyState>(context, listen: false);
        state.trueTile(tile);
      },
    );
  }
}
//////////////////////////////////////////////////////////////
/*
      ListTile(
        title: Text(tile.text),

        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTile(tile);
          },
        ),
      )
    );
    */