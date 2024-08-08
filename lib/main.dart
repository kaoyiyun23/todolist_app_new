import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../screens/login_screen.dart';
import '../screens/todolist_screen.dart';
//import '../controller/screen_controller.dart';
import '../screens/complete_todolist_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final ScreenController screenController = ScreenController();

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