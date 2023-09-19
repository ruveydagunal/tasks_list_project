import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_list_project/task/view_model/task_bloc.dart';
import 'package:tasks_list_project/task/view_model/task_event.dart';
import 'package:tasks_list_project/task/view_model/task_state.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});

  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context , state) {
           return Scaffold(
            appBar: AppBar(
              title: Text('Görev Listesi'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                TextFormField(
                  controller: taskController,
                  decoration: InputDecoration(
                    hintText: 'Yeni Görev Giriniz',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: () {
                      context.read<TaskBloc>().add(AddTaskEvent(taskController.text));
                      taskController.clear();
                    }, child: Text('Ekle')),
                    ElevatedButton(onPressed: () {
                      context.read<TaskBloc>().add(ClearTaskEvent());
                    }, child: Text('Hepsini Sil')),
                  ],
                ),
                Expanded(child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(state.tasks[index]),
                      trailing: IconButton(onPressed: (){
                        context.read<TaskBloc>().add(CompleteTaskEvent(index));
                      } ,icon: Icon(Icons.edit)),
                      leading: IconButton(onPressed: (){
                        context.read<TaskBloc>().add(CompleteTaskEvent(index));
                      } ,icon: Icon(Icons.done)),
                    );
                  }))
              ]),
            ),
          
            );
        },
       
      ),
    );
  }
}
