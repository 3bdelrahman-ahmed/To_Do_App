import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/Components/colors.dart';
import 'package:to_do_app/Components/todoitems.dart';
import 'package:to_do_app/Src/rootapp.dart';
import 'package:to_do_app/cubit/add_task_cubit.dart';
import '../Components/todoclass.dart';
import '../cubit/tasksmo_cubit.dart';

double Value = 0;

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final todolist = ToDo.todoitems();

  final controllerr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                color: icon ? tdGrey : tdblack,
              ),
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.51),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Value = 0;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 27,
                          color: icon ? text : c,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.07,
                          left: MediaQuery.of(context).size.width * 0.055),
                      width: MediaQuery.of(context).size.width * 0.45,
                      //height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.1,
                                backgroundImage:
                                    const AssetImage('assets/user.png'),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                'Hello, Abdelrahman',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: icon ? text : c,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: icon ? text : c,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Home',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 17,
                                      color: icon ? text : c,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.analytics,
                                    color: icon ? text : c,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Analystics',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 17,
                                      color: icon ? text : c,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    color: icon ? text : c,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Catgories',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 17,
                                      color: icon ? text : c,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    BlocBuilder<TasksmoCubit, TaskNo>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text(
                              'Number of your tasks is :',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: icon ? text : c,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              state.tasks.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: icon ? text : c,
                                  fontWeight: FontWeight.bold),
                            ),
                            if (state.tasks.toString() == '0')
                              Text(
                                'it is time for : استراحة محارب',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: icon ? text : c,
                                ),
                              )
                            else
                              Text(
                                'Hurry up!!',
                                style: TextStyle(
                                    color: icon ? text : c,
                                    fontWeight: FontWeight.bold),
                              )
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            icon = !icon;
                            c = Colors.white;
                            text = Colors.black;
                          });
                        },
                        icon: icon
                            ? Icon(
                                dark,
                                color: Colors.white,
                              )
                            : Icon(
                                light,
                                color: Colors.black,
                              ))
                  ],
                ),
              )),
              /* Animation darwer & start of the home screen
    
    
    
    
              */
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: Value),
                duration: const Duration(milliseconds: 450),
                builder: (_, double val, __) {
                  return (Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(
                          0,
                          3,
                          MediaQuery.of(context).size.height *
                              0.36.toDouble() *
                              val)
                      ..rotateY((pi / 6) * val),
                    child: BlocConsumer<AddTaskCubit, AddTaskState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Scaffold(
                          resizeToAvoidBottomInset: false,
                          backgroundColor: icon ? c : text,
                          body: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.045),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.menu,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.043,
                                              color: icon ? text : c,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (Value == 0) {
                                                  Value = 1;
                                                }
                                              });
                                            },
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          "Whats Up Abdelrahman,,",
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 23,
                                            color: icon ? text : c,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: tdGrey, blurRadius: 10)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 4),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: Colors.black,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045,
                                          ),
                                          prefixIconConstraints: BoxConstraints(
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.056,
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Search',
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'All TO DOs',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 30,
                                      color: icon ? text : c,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.62,
                                    width: MediaQuery.of(context).size.width,
                                    color: icon ? c : text,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          for (ToDo todoo in AddTaskCubit.get(context).todolist2)
                                            ToDoItems(
                                              todo: todoo,
                                              ontodochange: handlechange,
                                              id: todoo.id,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.73,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.069,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: tdGrey,
                                                    blurRadius: 10)
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: TextField(
                                              controller: controllerr,
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      'Add your task here',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<TasksmoCubit>(context).incr();
                                            AddTaskCubit.get(context).addTask(controllerr.text);
                                            controllerr.clear();
                                          },
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.069,
                                              decoration: BoxDecoration(
                                                color: Colors.purple,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ));
                },
              ),
            ],
          ),
        );
      },
    );
  }

   void handlechange(ToDo todo) {
     setState(() {
     todo.done = !todo.done;
     });
   }
}
