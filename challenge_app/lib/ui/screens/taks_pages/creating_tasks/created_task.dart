import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/organisms/organisms.dart';
import 'package:challenge_app/config/provider/task_provider.dart';
import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreatedTask extends StatelessWidget {
  final Task task;

  CreatedTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task newTask = Task(
              title: "taskTitleController.text",
              description: "taskDescriptionController.text",
              keyWords: [],
              client: Reviewed(
                  idUser: '1152193027',
                  proposedPrice: 12
                ),
              scheduleDate: DateTime(
                  2022,
                  12,
                  12,
                  14,
                  20
                )
            );
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
        future: taskProvider.createTaskUseCase.createNewTask(newTask),
        builder: (context, snapshot) {
          Widget result = const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator()
                );
          if(snapshot.hasData) {
            Task? tareaCreada = snapshot.data;
            DateTime? scheduleDateAux =
                DateTime(
                  tareaCreada!.scheduleDate.year,
                  tareaCreada.scheduleDate.month,
                  tareaCreada.scheduleDate.day,
                  tareaCreada.scheduleDate.hour,
                  tareaCreada.scheduleDate.minute
                );

            result = Center(
              child: ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 80, 30, 40),
                children: [
                  BcText.h2(label: tareaCreada.title, textAlign: TextAlign.center,),
                  const SizedBox(height: 10),
                  BcText.bodyText(label: tareaCreada.description, textAlign: TextAlign.left),
                  const SizedBox(height: 30,),
                  BcText.smallText(label: tareaCreada.keyWords.join('/')),
                  const SizedBox(height: 20,),
                  BcText.h6(label: 'Cantidad: ${tareaCreada.count}'),
                  const SizedBox(height: 10,),
                  BcText.h6(label: "Precio propuesto: \u0024${tareaCreada.client.proposedPrice}"),
                  const SizedBox(height: 10,),
                  BcText.h6(label: "Fecha:   ${DateFormat('dd/MM/yyyy  H:MM').format(scheduleDateAux)}"),
                  const SizedBox(height: 50,),
                  Image.asset('assets/astronaut.png', height: 200, width: 200),
                ],
              ),
            );
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