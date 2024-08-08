import 'package:flutter/material.dart';
import 'package:flutter_application_8/components/common_drawer.dart';
import '../models/todo.dart';
import '../models/user.dart';
import '../daos/todo_dao_local_file.dart';
import '../daos/user_dao_local_file.dart';
import '../components/complete_todo_component.dart';

//complete todo的一覽頁
//使用StatefulWidget來讓畫面可以刷新

class CompleteTodolistScreen extends StatefulWidget {
  @override
  _CompleteTodolistScreenState createState() => _CompleteTodolistScreenState();
}

class _CompleteTodolistScreenState extends State<CompleteTodolistScreen> {
  final TodoDaoLocalFile _todoDao = TodoDaoLocalFile();
  final UserDaoLocalFile _userDao = UserDaoLocalFile();

  //設定初始值
  List<Todo> _todos = [];
  User _user = User(totalTodos: 0, completedTodos: 0);

  //每次刷新都去重新讀取todo.json和user.json
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  //讀取todo.json和user.json
  Future<void> _loadData() async {
    final todos = await _todoDao.readTodos();
    final user = await _userDao.readUser();
    setState(() {
      _todos = todos;
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadData();

    //過濾出完成的todo
    List<Todo> tmpTodo = [];
    for(int i = 0; i < _todos.length; i++) {
      if(_todos[i].status == true) {
        tmpTodo.add(_todos[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Todo List'),
      ),
      drawer: CommonDrawer.getDrawer(context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tmpTodo.length,
              itemBuilder: (context, index) {
                final todo = tmpTodo[index];
                return CompleteTodoComponent(todo, index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Completed Todos: ${_user.completedTodos}'),
          ),
        ],
      ),
    );
  }
}