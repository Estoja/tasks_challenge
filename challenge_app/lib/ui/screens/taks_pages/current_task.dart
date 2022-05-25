import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:challenge_app/ui/screens/taks_pages/commons/list_item.dart';
import 'package:flutter/material.dart';

class CurrentTask extends StatelessWidget {
  const CurrentTask({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          BcText.h2(label: "Trabajo en proceso"),
          Expanded(
            child: ListView(

              scrollDirection: Axis.vertical,
              padding: const EdgeInsetsDirectional.only(top: 20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BcAvatar(
                      image: AssetImage('assets/logo.png'),
                      size: BcSizeType.Default,
                    ),
                    BcText.h4(label: 'Esteban Toledo Jaramillo')
                  ],
                ),
                Padding(
                  padding:
                    const EdgeInsetsDirectional
                      .fromSTEB(
                        20, 40, 20, 60
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BcText.h3(label: 'Descripción'),
                      BcText.labelText(
                          label: 'Una descripcion larga',
                          textAlign: TextAlign.justify,
                        ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BcText.h3(label: 'Fecha:'),
                          BcText.h5(label: '24/05/2022',)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BcText.h3(label: 'Hora inicio:'),
                          BcText.h5(label: '13:11',)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BcText.h3(label: 'Duración'),
                          BcText.h5(label: '01:15',)
                        ],
                      ),
                    ],
                  ),
                ),
                BcBtn(
                  onPressed: () {},
                  buttonType: BcButtonType.Primary,
                  sizeType: BcSizeType.Small,
                  text: 'text'
                )
              ],
            )
          )
        ],
      ),
    );
  }

}