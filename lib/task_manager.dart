import 'package:flutter/material.dart';
import 'task_item.dart';

class TaskManager extends StatelessWidget {
  final List<TaskItem> tasks;
  final Function(String) AddToList;
  final Function(int) Delete;
  final Function(int) Checked;
  final List<TaskItem> Function() getCompletedTasks;
  final List<TaskItem> Function() getUncompletedTasks;
  final String? filter; // null = show all, 'completed' = only completed, 'pending' = only pending
  
  const TaskManager({
    super.key,
    required this.tasks,
    required this.AddToList,
    required this.Delete,
    required this.Checked,
    required this.getCompletedTasks,
    required this.getUncompletedTasks,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Task manger',
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        ),
      
    );
  }
}