

import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:challenge_app/ui/screens/taks_pages/commons/list_item.dart';
import 'package:challenge_app/ui/screens/taks_pages/enums/tasks_enumerables.dart';
import 'package:flutter/material.dart';

class StandByTasks extends StatelessWidget {
  const StandByTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          BcText.h2(label: "Trabajos en espera"),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsetsDirectional.only(top: 20),
              children: const [
                ListItem(
                  image: AssetImage('assets/logo.png'),
                  name: 'Json',
                  price: 12,
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                ListItem(
                  image: AssetImage('assets/logo.png'),
                  name: 'Json',
                  price: 12,
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
              ],
            )
          )
        ],
      ),
    );
  }

}