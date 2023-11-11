import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nbc_app/screens/notifications_screen.dart';
import 'package:file_picker/file_picker.dart';

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
  PlatformFile? pickedFile;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
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
            ElevatedButton(onPressed: selectFile, child: Text("SELECT FILE")),
            ElevatedButton(onPressed: selectFile, child: Text("UPLOAD FILE")),
            ElevatedButton(
                onPressed: () {
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                    'title': titleController.text.toString(),
                    'detail': detailController.text.toString()
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
