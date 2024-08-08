import 'package:flutter/material.dart';

class CommonDrawer {
  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("工作項目"),
            onTap: () {
              Navigator.pushNamed(context, "/todolist");
            },
          ),
          ListTile(
            title: const Text("完成工作紀錄"),
            onTap: () {
              Navigator.pushNamed(context, "/completedtodolist");
            },
          )
        ],
      ),
    );
  }
}
