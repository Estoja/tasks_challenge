import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/organisms/organisms.dart';
import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:challenge_app/ui/screens/commons/datePicker.dart';
import 'package:challenge_app/ui/screens/commons/timePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTask extends StatelessWidget {

  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController taskTitleController = TextEditingController();
    TextEditingController taskDescriptionController = TextEditingController();
    TextEditingController keyWordsController = TextEditingController();
    TextEditingController counterController = TextEditingController();
    TextEditingController proposedPriceController = TextEditingController();
    DateTime? date;
    TimeOfDay? timeOfDay;
    final DatePicker datePicker = DatePicker(simpleDate: date);
    final TimePicker timePicker = TimePicker(simpleTime: timeOfDay);

    _sendInfoTask(){
      Navigator.pushNamed(
          context,
          AppRoutes.createdTask,
          arguments: Task(
              title: taskTitleController.text,
              description: taskDescriptionController.text,
              keyWords: keyWordsController.text.split('/'),
              count: int.parse(counterController.text),
              client: Reviewed(
                  idUser: '1152193027',
                  proposedPrice: int.parse(proposedPriceController.text)
                ),
              scheduleDate: DateTime(
                  datePicker.simpleDate!.year,
                  datePicker.simpleDate!.month,
                  datePicker.simpleDate!.day,
                  timePicker.simpleTime!.hour,
                  timePicker.simpleTime!.minute
                )
            )
        );
    }

    return Scaffold(
      appBar: BcHeaderNavigationBar(
        title: 'Nueva tarea',
        image: Image.asset('assets/logo.png'),
        rightItem: BcHeaderNavigationBarItem(
          icon: BcFunctionalIcons.ARROW2_RIGHT,
          label: 'Crear',
          onButtonTap: _sendInfoTask
          ),
        leftItem: BcHeaderNavigationBarItem(
          icon: BcFunctionalIcons.ARROW2_LEFT,
          onButtonTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 100, 30, 40),
          children: [
            BcInput(
              controller: taskTitleController,
              focusNode: FocusNode(),
              labelText: 'Titulo trabajo',
              hintText: 'Pasear la casa',
            ),
            const SizedBox(height: 50),
            BcInput(
              controller: taskDescriptionController,
              focusNode: FocusNode(),
              labelText: 'Descripcion',
              hintText: 'Llevar la casa al parque para que no se aburra',
              type: BcInputType.TextArea,
            ),
            const SizedBox(height: 40),
            BcInput(
              controller: keyWordsController,
              focusNode: FocusNode(),
              labelText: 'Palabras clave',
              hintText: 'Ventana/limpiar/dos pisos/cantidad=20',
              helpText: 'Slash para separar las palabras',
            ),
            const SizedBox(height: 40),
            TextField(
              controller: counterController,
              decoration: const InputDecoration(labelText: "Ingresa la cantidad"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const SizedBox(height: 40),
            TextField(
              controller: proposedPriceController,
              decoration: const InputDecoration(labelText: "Precio"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const SizedBox(height: 40),
            datePicker,
            const SizedBox(height: 40),
            timePicker,
            const SizedBox(height: 70),
            BcBtn(
              onPressed: _sendInfoTask,
              buttonType: BcButtonType.Primary,
              sizeType: BcSizeType.Small,
              text: 'Crear'
            ),
          ],
        ),
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
      ),
    );
  }

}