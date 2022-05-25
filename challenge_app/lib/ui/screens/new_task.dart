import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/organisms/organisms.dart';
import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BcHeaderNavigationBar(
        title: 'Nueva tarea',
        image: Image.asset('assets/logo.png'),
        rightItem: BcHeaderNavigationBarItem(
          icon: BcFunctionalIcons.ARROW2_RIGHT,
          label: 'Coninuar',
          onButtonTap: () => Navigator.of(context).pop()
          ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 100, 30, 40),
          children: [
            BcInput(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Titulo trabajo',
              hintText: 'Pasear la casa',
            ),
            const SizedBox(height: 40),
            BcInput(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Descripcion',
              hintText: 'Llevar la casa al parque para que no se aburra',
              type: BcInputType.TextArea,
            ),
            const SizedBox(height: 40),
            BcInput(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Palabras clave',
              hintText: 'Ventana/limpiar/dos pisos/cantidad=20',
              helpText: 'Enter despues de cada palabra',
            ),
            const SizedBox(height: 100),
            BcBtn(
              onPressed: () => {},
              buttonType: BcButtonType.Primary,
              sizeType: BcSizeType.Small,
              text: 'Continuar'
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