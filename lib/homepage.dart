import 'package:firebase_project/services/firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _MyAppState();
}

class _MyAppState extends State<Homepage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController _notecontroller = TextEditingController();
  void addDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('add note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(label: Text("add notes")),
                controller: _notecontroller,
              ),
              ElevatedButton(
                onPressed: () {
                  firestoreService.addData(_notecontroller.text);
                  Navigator.pop(context);
                },
                child: Text('submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("noteapp"),
          backgroundColor: Colors.blue[300],
          elevation: 2,
        ),
        body: ElevatedButton(onPressed: addDialog, child: Icon(Icons.add)),
      ),
    );
  }
}
