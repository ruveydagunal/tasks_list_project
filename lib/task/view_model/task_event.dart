abstract class TaskEvent{}

class AddTaskEvent extends TaskEvent{
  final String task;

  AddTaskEvent(this.task);
}

class ClearTaskEvent extends TaskEvent{}

class CompleteTaskEvent extends TaskEvent{
  final int index;

  CompleteTaskEvent(this.index);
}