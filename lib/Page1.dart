import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CalenderPage.dart';
import 'Models/TaskModel.dart';
import 'Widgets/FAB.dart';
import 'Widgets/taskBody.dart';

class Page1 extends StatefulWidget {

  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<Tasks> _list = taskList;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: _AppBar(),
      body: (_list.length > 0)? TaskBody(): _NoTaskBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Fab(
        onTaskAdded: (title) {
          setState(() {
            taskList.add(
              Tasks(taskId: taskList.length + 1, taskTitle: title),
            );
          });
        },
      ),

      bottomNavigationBar: _BottomNavigationBar(context),
    );
  }
}

PreferredSizeWidget _AppBar(){
  return AppBar(
    backgroundColor: Colors.black12,
    centerTitle: true,
    title: Text(
      "Home",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey[300]),
    ),
  );
}

Widget _NoTaskBody(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/BodyImg.png"),
        Text(
          "What do you want to do today?",
          style: TextStyle(fontSize: 26, color: Colors.grey[300]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Tap + to add your tasks",
          style: TextStyle(fontSize: 19, color: Colors.grey[300]),
        ),
      ],
    ),
  );
}


Widget _BottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.transparent,
    onTap: (index) {
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarPage()),
        );
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendar"),
    ],
  );
}



