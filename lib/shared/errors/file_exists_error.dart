class FileExistsError implements Exception {
  final String _message;
  final Exception innerException;

  FileExistsError(
      {this.innerException, String message = 'This file already exists'})
      : _message = message;

  String get message => _message;
}
