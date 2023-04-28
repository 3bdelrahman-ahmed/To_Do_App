import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Screens/first_screen.dart';
import 'package:to_do_app/cubit/tasksmo_cubit.dart';

class RootApp extends StatefulWidget {
  @override
  State<RootApp> createState() => _RootAppState();
}
  bool icon=false;
  IconData light=Icons.wb_sunny;
  IconData dark=Icons.nights_stay;
    Color c=Color.fromARGB(255, 14, 13, 13);
    Color text =Colors.white;
class _RootAppState extends State<RootApp> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksmoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
