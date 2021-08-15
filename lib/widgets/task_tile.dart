import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkboxCallBack;
  final Function()? longPressCallBack;

  TaskTile(
      {this.taskTitle = '',
      this.isChecked = false,
      required this.checkboxCallBack,
      required this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
      onLongPress: longPressCallBack,
    );
  }
}
