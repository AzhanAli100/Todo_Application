class Tasks{
  int? taskId;
  String? taskTitle;
  bool isDone;

  Tasks({ required this.taskId, required this.taskTitle, this.isDone = false});
}

List<Tasks> taskList = [
];
