import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nbc_app/screens/notifications_screen.dart';

class NotifcationsScreen extends StatefulWidget {
  const NotifcationsScreen({super.key});

  @override
  State<NotifcationsScreen> createState() => _NotifcationsScreenState();
}

class _NotifcationsScreenState extends State<NotifcationsScreen> {
  final CollectionReference _notificationCollection =
      FirebaseFirestore.instance.collection('notificationsData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _notificationCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // If the connection is active and there is no error, build the list.
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var user = snapshot.data!.docs[index];
            return ListTile(
              leading: Text(user['title']),
              title: Text(user['details']),
              subtitle: Text(user['timeStamp']),
            );
          },
        );
      },
    ));
  }
}
