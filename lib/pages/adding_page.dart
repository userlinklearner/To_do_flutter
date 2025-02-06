import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do.dart';

class AddingPage extends StatelessWidget {
  AddingPage({super.key});
  final toDoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new To-Do'),
      ),
      body: Card(
        child: Column(children: [
          Text('ToDo Title:'),
          TextField(controller: toDoTitleController),
          ElevatedButton(
            onPressed: () {
              final new_todo = ToDo(title: toDoTitleController.text, done: false);
              Navigator.of(context).pop(new_todo);
            },
            child: Text('Add'),
          ),
        ]),
      ),
    );
  }
}
