import 'package:flutter/material.dart';
import '/models/task.dart';
import 'package:provider/provider.dart';
import '/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({required this.addTaskCallBack});

  final Function addTaskCallBack;

  @override
  Widget build(BuildContext context) {

    String newTaskTitle = '';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const Padding(padding: EdgeInsets.all(5.0)),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
