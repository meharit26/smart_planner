import 'package:flutter/material.dart';
import 'home.dart';
import 'task_manager.dart';
import 'task_item.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
} 

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  List<TaskItem> tasks = [];
  String? _taskFilter; 
   
  void _addToList(String title) {
    if (title.isNotEmpty) {
      setState(() {
        tasks.add(TaskItem(title: title));
      });
    }
  }
   
  void _delete(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
  
  void _checked(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  List<TaskItem> _completedTasks() {
    return tasks.where((todo) => todo.isCompleted).toList();
  }

  List<TaskItem> _uncompletedTasks() {
    return tasks.where((todo) => !todo.isCompleted).toList();
  }

  void _navigateToTasksWithFilter(String? filter) {
    setState(() {
      _currentIndex = 1;  
      _taskFilter = filter;  
    });
  }

  @override
  Widget build(BuildContext context) {
     
    final List<Widget> pages = [
       
      Home(
        completedCount: _completedTasks().length,
        uncompletedCount: _uncompletedTasks().length,
        onNavigateToTasks: _navigateToTasksWithFilter, 
      ),
       
      TaskManager(
        tasks: tasks, 
        AddToList: _addToList,
        Delete: _delete,
        Checked: _checked,
        getCompletedTasks: _completedTasks,
        getUncompletedTasks: _uncompletedTasks,
        filter: _taskFilter,  
      ),
    ];

    return Scaffold(
       
      body: pages[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
             
            if (index == 1) {
              _taskFilter = null;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }
}
