import 'package:flutter/material.dart';
import 'package:nbc_app/screens/map_screen.dart';
import 'package:nbc_app/screens/post_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        ElevatedButton(
          child: Text("MAP"),
          onPressed: () => MapScreen(),
        ),
        ElevatedButton(onPressed: () => MapScreen(), child: Text("DIRECTORY")),
        ElevatedButton(
            onPressed: () => MapScreen(), child: Text("GENERAL NOTIFICATIONS")),
        ElevatedButton(onPressed: () => MapScreen(), child: Text("MENU")),
        ElevatedButton(
            onPressed: () => MapScreen(), child: Text("ADMIN LOGIN")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostScreenAdmin(),
                ),
              );
            },
            child: Text("POST SCREEN"))
      ])),
    );
  }
}
