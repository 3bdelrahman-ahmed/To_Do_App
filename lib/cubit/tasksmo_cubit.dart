import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/Src/rootapp.dart';

part 'tasksmo_state.dart';

class TasksmoCubit extends Cubit<TaskNo> {
  TasksmoCubit() : super(TaskNo(tasks: 0));
  void incr(){
    return emit(TaskNo(tasks: state.tasks!+1));
  }
  void decr(){
    while(state.tasks!>0){
return emit(TaskNo(tasks: state.tasks!-1));
    }
  }
}
