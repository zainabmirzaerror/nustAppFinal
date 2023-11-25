import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nbc_app/screens/notifications_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostScreenAdmin extends StatefulWidget {
  const PostScreenAdmin({super.key});

  @override
  State<PostScreenAdmin> createState() => _PostScreenAdminState();
}

class _PostScreenAdminState extends State<PostScreenAdmin> {
  final titleController = TextEditingController();
  final detailController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final CollectionReference _notificationCollection =
      FirebaseFirestore.instance.collection('notificationsData');
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  PlatformFile? pickedFile;
  String? downloadUrl;

  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uplaodFile() async {
    final path = 'impFiles/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    downloadUrl = await ref.getDownloadURL();
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(hintText: "Title"),
              controller: titleController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Details"),
              controller: detailController,
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (pickFile), child: Text("SELECT FILE")),
            ElevatedButton(onPressed: (uplaodFile), child: Text("UPLOAD FILE")),
            ElevatedButton(
                onPressed: () async {
                  await _firebaseFirestore.collection('notificationsData').add({
                    "title": titleController.text.toString(),
                    "details": detailController.text.toString(),
                    "downloadLink": downloadUrl,
                    "timeStamp": DateTime.now().toString()
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => NotifcationsScreen())));
                },
                child: Text("Add Post"))
          ],
        ),
      ),
    );
  }
}
