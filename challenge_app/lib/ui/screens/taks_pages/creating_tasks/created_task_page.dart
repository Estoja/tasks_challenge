import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/organisms/organisms.dart';
import 'package:challenge_app/config/provider/task_provider.dart';
import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:challenge_app/ui/domain/task/new_task_created.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatedTaskPage extends StatelessWidget {
  final Task task;

  const CreatedTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: BcHeaderNavigationBar(
        title: 'Tarea creada',
        image: Image.asset('assets/logo.png'),
        rightItem: BcHeaderNavigationBarItem(
          icon: BcFunctionalIcons.ARROW2_RIGHT,
          label: 'Continuar',
          onButtonTap: () => Navigator.of(context).pushNamed(AppRoutes.availableServices)
          ),
      ),
      body: FutureBuilder<Task>(
        future: taskProvider.createTaskUseCase.createNewTask(task),
        builder: (context, snapshot) {
          Widget result = const Center(
            child: BcLoader(speed: 1500, type: BcLoaderSize.Default)
          );
          if(snapshot.hasData) {
            result = NewTaskCreated(task: snapshot.data);
          } else if (snapshot.hasError) {
            result = Text('ERROR: ${snapshot.error}');
          }
          return result;
        },
      ),
      bottomNavigationBar: BcBottomNavigationBar(
        currentIndex: 1,
        onTap: (value) => {},
        items: [
          BcBottomNavigationBarItem(
            title: 'Buscar',
            icon: BcFunctionalIcons.RECEIPT_SEARCH,
          ),
          BcBottomNavigationBarItem(
            title: 'Agregar',
            icon: BcFunctionalIcons.RECEIPT_ADD,
          ),
          BcBottomNavigationBarItem(
            title: 'Historial',
            icon: BcFunctionalIcons.NEWS,
          ),
          BcBottomNavigationBarItem(
            title: 'Perfil',
            icon: BcFunctionalIcons.USER,
          ),
        ],
      ),)
    ;
  }

}