import 'package:challenge_app/domain/models/task/task.dart';

abstract class TaskGateway {
  Future<List<Task>> getPotencialTasks();
  Future<Task> createTask(Task task);
}