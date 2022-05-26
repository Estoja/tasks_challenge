import 'package:challenge_app/domain/models/task/gateway/task_gateway.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:flutter/material.dart';

class CreateTaskUseCase {
  final TaskGateway _taskGateway;
  CreateTaskUseCase(this._taskGateway);

  Future<Task> createNewTask(Task newTask) async => _taskGateway.createTask(newTask);
  
}

/* 
 String title,
      String description,
      List<String> keyWords,
      int count,
      Reviewed client,
      DateTime scheduleDate,
      TimeOfDay scheduleTimeOfDay ) async {
        DateTime dateTime =
            DateTime.utc(
              scheduleDate.year,
              scheduleDate.month,
              scheduleDate.day,
              scheduleTimeOfDay.hour,
              scheduleTimeOfDay.minute
            );
        Task newTask = Task(
          title: title,
          description: description,
          keyWords: keyWords,
          count: count,
          client: client,
          scheduleDate: dateTime,
        );*/