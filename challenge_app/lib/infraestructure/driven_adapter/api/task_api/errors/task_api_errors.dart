class TaskApiErrors implements Exception {
  late String _message;

  TaskApiErrors(String message) {
    _message = 'TaskApi no pudo conectarse con el servicio: $message';
  }

  @override
  String toString(){
    return _message;
  }

}