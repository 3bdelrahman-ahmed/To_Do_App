import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? text;
  bool done; 


  ToDo({
    required this.id,
    required this.text,
    this.done=false,
  });

  static List<ToDo> todoitems(){
    return[
      ToDo(id: '1', text: 'add your task below'),
    ];
  }
}