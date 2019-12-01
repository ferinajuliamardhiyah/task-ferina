import 'package:cobacobi/todo.dart';
import 'package:flutter/material.dart';

class EditList extends StatelessWidget {
  final Todo todos;
  final index;
  final editToDo;

  EditList({Key key, @required this.todos, this.index, this.editToDo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit List')),
      body: Container(
          child: TextFormField(
        initialValue: todos.tugas,
        onFieldSubmitted: (val) {
          editToDo(val, index);
          Navigator.pop(context);
        },
      )),
    );
  }
}
