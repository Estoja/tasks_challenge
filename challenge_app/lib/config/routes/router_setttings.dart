import 'package:bds_mobile/foundations/helpers/platform/platform_js.dart';
import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:challenge_app/ui/screens/login.dart';
import 'package:challenge_app/ui/screens/taks_pages/creating_tasks/created_task_page.dart';
import 'package:challenge_app/ui/screens/taks_pages/creating_tasks/new_task.dart';
import 'package:challenge_app/ui/screens/taks_pages/processing_tasks/tasks_pages.dart';
import 'package:flutter/material.dart';

MaterialPageRoute getRoutes (RouteSettings settings) {
  MaterialPageRoute page;
  switch(settings.name) {
    case (AppRoutes.newTask):
      page = MaterialPageRoute(builder: (context) => const NewTask());
      break;
    case (AppRoutes.createdTask):
      final newTask = settings.arguments as Task;
      page = MaterialPageRoute(builder: (context) => CreatedTaskPage(task: newTask,));
      break;
    case (AppRoutes.availableServices):
      page = MaterialPageRoute(builder: (context) => const TasksPages());
      break;
    case (AppRoutes.login):
      page = MaterialPageRoute(builder: ((context) => const Login()));
      break;
    default:
      page = MaterialPageRoute(builder: (context) =>  const Login());
      break;
  }
  return page;
}