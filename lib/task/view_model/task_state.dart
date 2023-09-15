abstract class TaskState {
  final List<dynamic> tasks;

  TaskState(this.tasks);
}

class TaskInitalState extends TaskState{
  List<dynamic> tasks;

  TaskInitalState(this.tasks) : super(tasks);
}
