import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile({Key? key,required this.toDo}) : super(key: key);

final ToDo toDo;
  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.toDo.title),
      trailing: Checkbox(
        value: widget.toDo.done, onChanged: (bool? value) {
          setState(() {
            widget.toDo.done = value!;
          });
        }),
    );
  }
}