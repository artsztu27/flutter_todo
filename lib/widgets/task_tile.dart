import 'package:flutter/material.dart';
import '../providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile(this.task, {super.key});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    void _checkItem(bool? value) {
      setState(() {
        Provider.of<TaskProvider>(context, listen: false)
            .changeStatus(widget.task.id);
        //print('SET STATE ${widget.task.isDone.toString()}');
      });
    }

    return ListTile(
      title: Text(widget.task.title),
      leading: Checkbox(
        value: widget.task.isDone,
        onChanged: _checkItem,
      ),
    );
  }
}
