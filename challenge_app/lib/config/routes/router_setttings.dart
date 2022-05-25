import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:challenge_app/ui/screens/new_task.dart';
import 'package:challenge_app/ui/screens/taks_pages/tasks_pages.dart';
import 'package:flutter/material.dart';

MaterialPageRoute getRoutes (RouteSettings settings) {
  MaterialPageRoute page;
  switch(settings.name) {
    case (AppRoutes.newTask):
      page = MaterialPageRoute(builder: (context) => const NewTask());
      break;
    case (AppRoutes.availableServices):
      page = MaterialPageRoute(builder: (context) => const TasksPages());
      break;
    case (AppRoutes.login):
    default:
      page = MaterialPageRoute(builder: (context) =>  const TasksPages());
      break;
  }
  return page;
}