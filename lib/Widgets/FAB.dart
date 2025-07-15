import 'package:flutter/material.dart';

import '../Models/TaskModel.dart';

class Fab extends StatelessWidget {
  final Function(String) onTaskAdded;

  Fab({super.key, required this.onTaskAdded});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.grey[200],
          context: context,
          isScrollControlled: true,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Add Task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      onTaskAdded(text); // <-- Call parent function
                      Navigator.pop(context);
                      _controller.clear();
                    }
                  },
                  child: Text("Add", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        );
      },
      backgroundColor: Colors.grey[200],
      tooltip: "Add Task",
      shape: CircleBorder(),
      child: Icon(Icons.add),
    );
  }
}

