import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import '../screens/login_screen.dart';
//import '../screens/todolist_screen.dart';
import '../controller/screen_controller.dart';
//import '../screens/complete_todolist_screen.dart';

//將用戶訪問路徑轉到對應controller

void main() {
  //確保畫面已經初始
  WidgetsFlutterBinding.ensureInitialized();
  
  //runApp(MyApp());
  runApp(const ScreenController());
}

/* class MyApp extends StatelessWidget {
  final ScreenController screenController = ScreenController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        /* "/login": (BuildContext context) => LoginScreen(),
        "/todolist": (BuildContext context) => TodoListScreen(),
        "/completedtodolist": (BuildContext build) => CompleteTodolistScreen() */
      },
      initialRoute: "/login",
    );
  }
} */