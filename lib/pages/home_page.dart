import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do.dart';
import 'package:to_do_list/widgets/todo_tile.dart';
import 'package:to_do_list/pages/adding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  List<ToDo> toDos = [];

  @override
  void initState() {
    super.initState();
    _loadToDos();
  }

  Future<void> _loadToDos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoString = prefs.getString('toDos');

    if (todoString != null) {
      List<dynamic> jsonList = jsonDecode(todoString);
      List<ToDo> loadedToDos = jsonList.map((e) => ToDo.fromJson(e)).toList();

      setState(() {
        toDos = loadedToDos;
      });
    }
  }

  Future<void> _saveToDos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();//access local storage
    String toDoString = jsonEncode(toDos.map((e) => e.toJson()).toList());
    await prefs.setString('toDos', toDoString);
  }

  void deleteItem(int index) {
    setState(() {
      toDos.removeAt(index);
    });
    _saveToDos(); // Call outside setState()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newToDo = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddingPage()),
              );

              if (newToDo != null && newToDo is ToDo) {
                setState(() {
                  toDos.add(newToDo);
                });
                _saveToDos(); // Save after adding
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            toDo: toDos[index],
            onDelete: () {
              deleteItem(index);
            },
          );
        },
      ),
    );
  }
}
