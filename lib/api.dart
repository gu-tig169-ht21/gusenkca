// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'stuff.dart';

const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';
const API_KEY = '0023bf8c-bccd-486c-85de-e72aab0eaf49';

class Api {
  static Future<List<TodoListTile>> addTile(TodoListTile tile) async {
    Map<String, dynamic> json = TodoListTile.toJson(tile);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoListTile>((data) {
      return TodoListTile.fromJson(data);
    }).toList();
  }

  static Future deleteTile(String id) async {
    var response =
        await http.delete(Uri.parse('$API_URL/todos/$id?key=$API_KEY'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoListTile>((data) {
      return TodoListTile.fromJson(data);
    }).toList();
  }

  static Future<List<TodoListTile>> getTiles() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<TodoListTile>((data) {
      return TodoListTile.fromJson(data);
    }).toList();
  }

  static Future editTile(TodoListTile tile, String id) async {
    Map<String, dynamic> json = TodoListTile.toJson(tile);
    var bodyString = jsonEncode(json);
    await http.put(
      Uri.parse('$API_URL/todos/$id?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
