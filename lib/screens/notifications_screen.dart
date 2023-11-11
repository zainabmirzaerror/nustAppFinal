import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class NotifcationsScreen extends StatefulWidget {
  const NotifcationsScreen({super.key});

  @override
  State<NotifcationsScreen> createState() => _NotifcationsScreenState();
}

class _NotifcationsScreenState extends State<NotifcationsScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: <Widget>[
            Expanded(
                child: FirebaseAnimatedList(
                    query: ref,
                    defaultChild: Text("Loading"),
                    itemBuilder: (context, snapshot, animation, index) {
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle:
                            Text(snapshot.child('detail').value.toString()),
                      );
                    }))
          ])),
    );
  }
}
