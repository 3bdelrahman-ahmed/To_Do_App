import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Components/colors.dart';
import 'package:to_do_app/Components/todoclass.dart';
import 'package:to_do_app/cubit/tasksmo_cubit.dart';

class ToDoItems extends StatelessWidget{

   ToDoItems({super.key, required this.todo, this.ontodochange, this.ondelete});
  final ToDo todo;
  final  ontodochange;
  final ondelete;
  @override
  Widget build(BuildContext context) {
    //var todo;
    return Container(
      margin:const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: tdGrey, blurRadius: 10)
            ],
        borderRadius: BorderRadius.circular(10),
      ),
        child: ListTile(
          onTap: () {
            ontodochange(todo);
            BlocProvider.of<TasksmoCubit>(context).decr();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
         // tileColor: Colors.white,
          leading: Icon(todo.done?Icons.check_box:Icons.check_box_outline_blank,color: tdblue,size: 25,),
          title:  Text(todo.text!,style:TextStyle(fontSize: 19,
          color: Colors.black,
          // ignore: unrelated_type_equality_checks
          decoration: todo.done ?TextDecoration.lineThrough:null
          ),),
          trailing: IconButton(onPressed: () {
          ondelete(todo.id);
          BlocProvider.of<TasksmoCubit>(context).decr();
          }, 
          icon: Icon(Icons.delete_forever_sharp,color: tdred,size: 28,)
          )
        ),
    );
  }
}