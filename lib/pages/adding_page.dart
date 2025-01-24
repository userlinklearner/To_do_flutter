import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new To-Do'),
      ),
      body: Card(
        child: Column(children: [
          Text('ToDo Title:'),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add'),
          ),
        ]),
      ),
    );
  }
}
