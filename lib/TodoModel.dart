import 'package:flutter/material.dart';
import 'package:todo/TaskModel.dart';

class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = [];

  addTaskInList(){
    TaskModel taskModel = TaskModel(title: "title ${taskList.length}", detail: "This is the task no detail");
    taskList.add(taskModel);
    notifyListeners();
  }

}