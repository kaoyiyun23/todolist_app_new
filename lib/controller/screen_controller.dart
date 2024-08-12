import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/todolist_screen.dart';
import '../screens/complete_todolist_screen.dart';

//檢測用戶的封包，對封包處理後，轉送到screen

class ScreenController extends StatelessWidget{
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/login": (BuildContext context) => LoginScreen(),
        "/todolist": (BuildContext context) => TodoListScreen(),
        "/completedtodolist": (BuildContext build) => CompleteTodolistScreen()
      },
      initialRoute: "/login",
    );
  }
}