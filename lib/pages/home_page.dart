import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do.dart';
import 'package:to_do_list/widgets/todo_tile.dart';
import 'package:to_do_list/pages/adding_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  List<ToDo> toDos = [
    ToDo(title: 'Buy groceries'),
    ToDo(title: 'Walk the dog', done: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final newToDo = (await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AddingPage())))as ToDo; //learn about casting
              setState(() {
                toDos.add(newToDo);
              });
            },
          ),
          TextButton(onPressed: (){}, child: Text('Add')),
        ],
      ),
      body: ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(toDo: toDos[index]);
        },
      ),
    );
  }
}