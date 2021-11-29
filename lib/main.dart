// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainview.dart';
import 'stuff.dart';

void main() {
  var state = MyState();

  state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: AttGora(),
    ),
  );
}

class AttGora extends StatelessWidget {
  const AttGora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
