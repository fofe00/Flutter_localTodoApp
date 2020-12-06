import 'package:flutter/material.dart';
import 'package:todo1/TaskModel.dart';

class TodoModel extends ChangeNotifier{
  List <TaskModel> tasklist=[];
  addTaskList (){
    TaskModel taskModel=TaskModel("titre${tasklist.length}","description ${tasklist.length}");
    tasklist.add(taskModel);
    print('fofe');
    notifyListeners();
  }

}