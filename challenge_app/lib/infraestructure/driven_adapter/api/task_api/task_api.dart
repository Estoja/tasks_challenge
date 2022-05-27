import 'dart:io';
import 'package:challenge_app/domain/models/task/gateway/task_gateway.dart';
import 'package:challenge_app/domain/models/task/task.dart';
import 'package:challenge_app/infraestructure/driven_adapter/api/task_api/mock/task_api_mock.dart';
import 'package:http/http.dart' as http;

class TaskApi extends TaskGateway {
  @override
  Future<List<Task>> getPotencialTasks() {
    // TODO: implement getPotencialTasks
    throw UnimplementedError();
  }

  @override
  Future<Task> createTask(Task task) async {
    Uri url = Uri.parse('http://prueba.co');
    try {
      var response = await getMockResponse();
          //await http.post(url, body: task.toJson());
     // if(response.statusCode != 200) throw HttpException('${response.statusCode}');
      return Task.fromMap(response);
    } on SocketException {
      throw "ERROR: No internet connection";
    } on HttpException {
      throw "ERROR: Couldn't find it 😱";
    } on FormatException {
      throw "ERROR: Bad response format";
    }
  }
}