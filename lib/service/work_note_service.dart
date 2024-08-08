import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../models/user.dart';
import '../daos/todo_dao_local_file.dart';
import '../daos/user_dao_local_file.dart';

//當用戶新增todo的時候， 會記錄用戶有幾個todo，會記錄todo內容
//當用戶刪除todo的時候，要減去用戶有幾個todo

class WorkNoteService {
  final TodoDaoLocalFile _todoDao = TodoDaoLocalFile();
  final UserDaoLocalFile _userDao = UserDaoLocalFile();

  //新增todo
  //會去寫入todo.json和user.json
  Future<void> addTodo(Todo todo) async {
    final todos = await _todoDao.readTodos();
    todos.add(todo);
    await _todoDao.writeTodos(todos);

    final user = await _userDao.readUser();
    user.totalTodos++;
    await _userDao.writeUser(user);
  }

  //刪除todo
  //會去更新todo.json和user.json
  Future<void> deleteTodoAtIndex(int index) async {
    final todos = await _todoDao.readTodos();
    final todo = todos[index];
    todos.removeAt(index);
    await _todoDao.writeTodos(todos);

    final user = await _userDao.readUser();
    user.totalTodos--;
    if (todo.status == true) {
      user.completedTodos--;
    }
    await _userDao.writeUser(user);
  }
  /* Future<void> deleteTodoAtIndex(Todo todo_delete) async {
    final todos = await _todoDao.readTodos();
    todos.remove(todo_delete.description);
    await _todoDao.writeTodos(todos);

    final user = await _userDao.readUser();
    user.totalTodos--;
    if (todo_delete.status == true) {
      user.completedTodos--;
    }
    await _userDao.writeUser(user);
  } */

  //更新todo的狀態
  //會去更新todo.json和user.json
  Future<void> updateTodoStatus(int index, bool status) async {
    final todos = await _todoDao.readTodos();
    final todo = todos[index];
    todo.status = status;
    if (status == true) {
      todo.completionTime = DateTime.now();
    }
    await _todoDao.writeTodos(todos);

    final user = await _userDao.readUser();
    if (status == true) {
      user.completedTodos++;
    } else if (todo.status == false) {
      user.completedTodos--;
    }
    await _userDao.writeUser(user);
  }
  /* Future<void> updateTodoStatus(Todo todo_update) async {
    final todos = await _todoDao.readTodos();
    int indexOfUpdate = todos.indexOf(todo_update);
    final todoUpdate = todos[indexOfUpdate];
    if (todoUpdate.status == true) {
      todoUpdate.completionTime = DateTime.now();
    }
    await _todoDao.writeTodos(todos);

    final user = await _userDao.readUser();
    if (todoUpdate.status == true) {
      user.completedTodos++;
    } else if (todoUpdate.status == false) {
      user.completedTodos--;
    }
    await _userDao.writeUser(user);
  } */
}
