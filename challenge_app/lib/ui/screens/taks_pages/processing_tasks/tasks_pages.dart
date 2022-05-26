
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/organisms/organisms.dart';
import 'package:challenge_app/ui/screens/taks_pages/processing_tasks/current_task.dart';
import 'package:challenge_app/ui/screens/taks_pages/processing_tasks/finished_tasks.dart';
import 'package:challenge_app/ui/screens/taks_pages/processing_tasks/standby_tasks.dart';
import 'package:flutter/material.dart';

class TasksPages extends StatefulWidget {
  const TasksPages({Key? key}) : super(key: key);

  @override
  State<TasksPages> createState() => _TasksPagesState();
}

class _TasksPagesState extends State<TasksPages> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/logo.png', height: 40, width: 40,),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(BcFunctionalIcons.TIME)),
              Tab(icon: Icon(BcFunctionalIcons.WRENCH)),
              Tab(icon: Icon(BcFunctionalIcons.OK)),
            ]
            ),
        ),
        body: const TabBarView(
              children: [
                StandByTasks(),
                CurrentTask(),
                FinishedTasks(),
              ],
            ),
        bottomNavigationBar: BcBottomNavigationBar(
          currentIndex: 2,
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
      ),
    );
  }
}
