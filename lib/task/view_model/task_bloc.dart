

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_list_project/task/view_model/task_event.dart';
import 'package:tasks_list_project/task/view_model/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState>{
  TaskBloc() : super(TaskInitalState([])){
    on<AddTaskEvent>(_onAddTask);
    on<ClearTaskEvent>(onClearTask);
    on<CompleteTaskEvent>(_onCompleteTask);
  }
    


  FutureOr<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final updatedTasks = List.from(state.tasks)..add(event.task);
    emit(TaskInitalState(updatedTasks));
  }

  FutureOr<void> onClearTask(ClearTaskEvent event, Emitter<TaskState> emit) {
    emit(TaskInitalState([]));
  }

  FutureOr<void> _onCompleteTask(CompleteTaskEvent event, Emitter<TaskState> emit) {
    final updatedTasks = List.from(state.tasks)..removeAt(event.index);
    emit(TaskInitalState(updatedTasks));
  }
}