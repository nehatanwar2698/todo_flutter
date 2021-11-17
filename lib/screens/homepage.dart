// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  //

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todoList = <String>[];

  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: ListView(
        children: _getItems(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _displayDialog(context);
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
      //  FloatingActionButton(
      //     onPressed: () => _displayDialog(context),
      //     tooltip: 'Add Item',
      //     child: Icon(Icons.add)),
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  // this Generate list of item widgets
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: 'Enter your task here'),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),

              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // iterates  list
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
      _todoWidgets.add(Divider());
      ;
    }
    return _todoWidgets;
  }
}
