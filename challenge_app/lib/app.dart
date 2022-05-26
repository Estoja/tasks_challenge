import 'package:challenge_app/config/provider/task_provider.dart';
import 'package:challenge_app/config/routes/app_routes.dart';
import 'package:challenge_app/config/routes/router_setttings.dart';
import 'package:challenge_app/domain/usecase/task/create_task_usecase.dart';
import 'package:challenge_app/infraestructure/driven_adapter/api/task_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bancolombia_foundations/bancolombia_foundations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...BancolombiaFoundations.themeProvider,
        ChangeNotifierProvider(
            create: (context) =>
                TaskProvider(createTaskUseCase: CreateTaskUseCase(TaskApi()))
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.login,
        onGenerateRoute: (settings) => getRoutes(settings),
      ),
    );
  }
}
