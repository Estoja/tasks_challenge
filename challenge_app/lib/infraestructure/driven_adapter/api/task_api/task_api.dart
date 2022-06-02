import 'dart:io';
import 'package:challenge_app/domain/models/task/gateway/task_gateway.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:challenge_app/infraestructure/driven_adapter/api/task_api/errors/task_api_errors.dart';
import 'package:http/http.dart' as http;

class TaskApi extends TaskGateway {
  @override
  Future<List<Task>> getPotencialTasks() {
    // TODO: implement getPotencialTasks
    throw UnimplementedError();
  }

  @override
  Future<Task> createTask(Task task) async {
    Uri url = Uri.http('10.0.2.2:3000','/task/create'); //localhost android
    try {
      var response =
          await http.post(
              url,
              headers: {"Content-Type": "application/json"},
              body: task.toJson()
            )
            .timeout(const Duration(seconds: 5));
      if(response.statusCode != 200) throw HttpException('${response.statusCode}');
      return Task.fromJson(response.body);
    } on SocketException catch(error) {
      throw TaskApiErrors("No internet connection. ${error.message}");
    } on HttpException catch(error) {
      throw TaskApiErrors("Couldn't find it 😱 ${error.message}");
    } on FormatException catch(error) {
      throw TaskApiErrors("Bad response format ${error.message}");
    } catch(error) {
      throw TaskApiErrors("Generic error. $error");
    }
  }
}