import 'package:challenge_app/domain/usecase/task/create_task_usecase.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier {

  final CreateTaskUseCase createTaskUseCase;

  TaskProvider({required this.createTaskUseCase});
}