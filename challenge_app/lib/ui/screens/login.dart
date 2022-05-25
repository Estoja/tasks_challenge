import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(80, 150, 80, 100),
          children: [
            Image.asset('assets/logo.png', height: 100, width: 100),
            const SizedBox(height: 80,),
            BcInput(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Usuario',
              hintText: 'coolNickName',
            ),
            const SizedBox( height: 20,),
            BcInput(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Contraseña',
              obscureText: true,
            ),
            const SizedBox(
              height: 50,
            ),
            BcBtn(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.newTask),
              buttonType: BcButtonType.Primary,
              sizeType: BcSizeType.Small,
              text: 'Iniciar sesión'
            ),
            const SizedBox(
              height: 24,
            ),
            BcBtn(
              onPressed: () => {},
              buttonType: BcButtonType.Secondary,
              sizeType: BcSizeType.Small,
              text: 'Crear cuenta'
            ),
          ],
        ),
      ),
    );
  }

}