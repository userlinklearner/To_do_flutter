import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile({Key? key, required this.toDo, required this.onDelete}) : super(key: key);

  final ToDo toDo;
  final VoidCallback onDelete;

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.toDo.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: widget.toDo.done,
            onChanged: (bool? value) {
              setState(() {
                widget.toDo.done = value!;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: widget.onDelete,
          ),
        ],
      ),
    );
  }
}