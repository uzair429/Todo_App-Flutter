import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/config/palette.dart';


class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Add Tasks ",),
    backgroundColor:const Color(0xFF3b5999),
    ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Palette.backgroundColor,
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Name OF Text',
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF3b5999)),
                ),
                onPressed: () { },
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
