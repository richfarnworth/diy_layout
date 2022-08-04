import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HandyObject {
  String objectType = "";
}

class Comment extends HandyObject {
  HandyObject subject;
  String commentText = "";
  Comment({required this.subject}) : super();
}

class UserAccount extends HandyObject {
  String userName;
  /*List<Property> properties = [];*/
  UserAccount({required this.userName}) : super();

  /*void addProperty(String propertyName, PropertyType propertyType) {
    properties.add(Property(propertyName: propertyName, propertyType: propertyType, userAccount: this));
  }*/

  Widget classicReturn() {
    return Text(userName);
  }
}



class Project extends HandyObject {
  String projectName;
  /*Property property;*/
  List<Task> tasks = [];
  Project({required this.projectName/*, required this.property*/}) : super();

  void addTasks(String taskName) {
    tasks.add(Task(taskName: taskName, project: this));
  }
}

class Task extends HandyObject {
  String taskName;
  Project project;
  List<Step> steps = [];
  Task({required this.taskName, required this.project}) : super();
  void addStep(stepText) {
    steps.add(Step(stepText: stepText, task: this));
  }
}

class Step extends HandyObject {
  String stepText;
  Task task;
  Step({required this.stepText, required this.task}) : super();
}
