import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/todoclass.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final todolist2 = ToDo.todoitems();
  AddTaskCubit() : super(AddTaskInitial());
    static AddTaskCubit get(context) => BlocProvider.of(context);

 void addTask(String task){
        todolist2.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), text: task));
          emit(AddTasktolist());
          
  }
  void deletfun(String id) {
      todolist2.removeWhere((element) => element.id == id);
      emit(DeleteTask());
  }
    void handlechange(ToDo todo) {
      todo.done = !todo.done;
  }
}
