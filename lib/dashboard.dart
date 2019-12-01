import 'package:cobacobi/add.dart';
import 'package:cobacobi/detail.dart';
import 'package:cobacobi/edit.dart';
//import 'package:cobacobi/detail.dart';
import 'package:cobacobi/todo.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Todo> todos = List.generate(8, (i) => Todo('Tugas Ke-${i+1}', 'Review Materi Hari Ke-${i+1}'));

  handleToDo(todo) {
    setState(() {
      todos.add(Todo('$todo', 'Review Materi $todo'));
    });
  }

  removeToDo(index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  editToDo(tu, index) {
    setState(() {
      todos[index].tugas = tu;
    });
  }

  checkList(val, index) {
    setState(() {
      todos[index].check = val;
    });
  }

  checkListAll(val) {
    setState(() {
      for (var i in todos) {
        i.check = val;
      }
      allCheck = val;
    });
  }

  bool allCheck = false;

  deleteAll() {
    setState(() {
      for (int i = 0; i < todos.length; i++) {
        if (todos[i].check) {
          todos.removeAt(i);
          i--;
        }
      }
    });
  }

  int jumlahChecked() {
    int jumlah = 0;
    setState(() {
      for (var item in todos) {
        if (item.check) {
          jumlah++;
        }
      }
    });
    return jumlah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),
        ),
        body: Column(children: <Widget>[
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BuildButtonComponent(
                  Colors.green, Icons.check, 'Done', jumlahChecked()),
              BuildButtonComponent(Colors.orange, Icons.calendar_today, 'Todo',
                  todos.length-jumlahChecked()),
              BuildButtonComponent(
                  Colors.blue, Icons.person_outline, 'Total', todos.length)
            ],
          )),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: todos.length == 0
              ? Text('No Data(s) Yet. Please Add New One', style: TextStyle(fontSize: 20))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Check All'),
                      Checkbox(
                        value: allCheck,
                        onChanged: (bool val) {
                          checkListAll(val);
                        },
                      ),
                    ],
                  ),
                ),
                RaisedButton.icon(
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    label: Text('Delete All Checked'),
                    onPressed: () {
                      deleteAll();
                      allCheck=false;
                    })
              ])
              ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.575,
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: ValueKey(todos[index].tugas),
                      onDismissed: (direction) {
                        removeToDo(index);
                      },
                      child: Card(
                          child: ListTile(
                              leading: Checkbox(
                                value: todos[index].check,
                                onChanged: (bool newValue) {
                                  todos[index].check = newValue;
                                  checkList(newValue, index);
                                  if(todos[index].check==false) {
                                    allCheck = false;
                                  }
                                  var jum = 0;
                                  for (var i = 0; i < todos.length; i++) {
                                    if(todos[i].check==true) {
                                      jum++;
                                    }
                                  }
                                  if (jum==todos.length) {
                                    allCheck=true;
                                  }
                                },
                              ),
                              title: todos[index].check==false
                              ? Text(todos[index].tugas)
                              : Text(todos[index].tugas, style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditList(
                                            todos: todos[index],
                                            index: index,
                                            editToDo: editToDo)));
                              },
                              onLongPress: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DetailScreen(todo: todos[index])
                                ));
                              },
                              )));
                }),
          )
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddList(handleToDo),
                  ));
            },
            child: Icon(Icons.add)));
  }
}

class BuildButtonComponent extends StatelessWidget {
  final icon;
  final color;
  final label;
  final int jumlah;
  BuildButtonComponent(this.color, this.icon, this.label, this.jumlah);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 125,
        height: 150,
        child: Card(
            child: Column(
          children: <Widget>[
            Text(label,
                style: TextStyle(
                  fontSize: 40,
                  color: color,
                )),
            Icon(icon, color: color, size: 60),
            Text(jumlah.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
          ],
        )));
  }
}
