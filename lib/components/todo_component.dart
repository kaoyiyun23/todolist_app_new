import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../service/work_note_service.dart';

class TodoComponent extends StatefulWidget {
  //帶狀態的核心資料
  Todo todo;
  int index;

  //建構子
  TodoComponent(this.todo, this.index);

  //指定依託的狀態
  @override
  State createState() {
    return _TodoComponentState();
  }
}

class _TodoComponentState extends State<TodoComponent> {
  final WorkNoteService _workNoteService = WorkNoteService();

  //實作Build方法
  @override
  Widget build(BuildContext context) {
    Widget listTodo = ListTile(
      title: Text(
        this.widget.todo.description,
        style: (this.widget.todo.status == true)
            ? TextStyle(decoration: TextDecoration.lineThrough)
            : TextStyle(),
      ),
      leading: Checkbox(
        value: this.widget.todo.status == true,
        onChanged: (usercheck) {
          _workNoteService.updateTodoStatus(this.widget.index, usercheck!);
          setState(() {
            this.widget.todo.status = !usercheck;
            
          });
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _workNoteService.deleteTodoAtIndex(this.widget.index);
          setState(() {
            
          });
        },
      ),
    );

    return Container(
      width: 500,
      child: listTodo,
    );
  }
}
