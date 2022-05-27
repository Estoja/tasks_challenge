import 'package:challenge_app/domain/models/task/gateway/task_gateway.dart';
import 'package:challenge_app/domain/models/task/task.dart';

class CreateTaskUseCase {
  final TaskGateway _taskGateway;
  CreateTaskUseCase(this._taskGateway);
  
  Future<Task> createNewTask(Task newTask) async => _taskGateway.createTask(newTask);
}