import 'package:flutter/material.dart';

import '../Models/TaskModel.dart';

class TaskBody extends StatefulWidget {

  const TaskBody({super.key});

  @override
  State<TaskBody> createState() => _TaskBodyState();
}

class _TaskBodyState extends State<TaskBody> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[700],
            ),
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: "Search",
                hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            "Tasks",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: (task.isDone)? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                  title: (task.isDone)? Text(task.taskTitle!,style: TextStyle(decoration: TextDecoration.lineThrough)) : Text(task.taskTitle!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        taskList.removeAt(index);
                      });
                    },
                  ),
                  onTap: (){
                    setState(() {
                      task.isDone = !task.isDone;
                    });
                  },
                  tileColor: Colors.grey[200],
                ),
              );
            },
          ),
        ),
      ],
    );;
  }
}
