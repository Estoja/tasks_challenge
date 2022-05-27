import 'package:bds_mobile/atoms/atoms.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTaskCreated extends StatelessWidget {
  final Task? task;

  const NewTaskCreated({
    Key? key,
    required this.task
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime(
      task!.scheduleDate.year,
      task!.scheduleDate.month,
      task!.scheduleDate.day,
      task!.scheduleDate.hour,
      task!.scheduleDate.minute
    );
    return Center(
      child: ListView(
        padding: const EdgeInsetsDirectional.fromSTEB(30, 80, 30, 40),
        children: [
          BcText.h2(label: task!.title, textAlign: TextAlign.center,),
          const SizedBox(height: 10),
          BcText.bodyText(label: task!.description, textAlign: TextAlign.left),
          const SizedBox(height: 30,),
          BcText.smallText(label: task!.keyWords.join('/')),
          const SizedBox(height: 20,),
          BcText.h6(label: 'Cantidad: ${task!.count}'),
          const SizedBox(height: 10,),
          BcText.h6(label: "Precio propuesto: \u0024${task!.client.proposedPrice}"),
          const SizedBox(height: 10,),
          BcText.h6(label: "Fecha:   ${DateFormat('dd/MM/yyyy  H:MM').format(time)}"),
          const SizedBox(height: 50,),
          Image.asset('assets/astronaut.png', height: 200, width: 200),
        ],
      ),
    );
  }
}