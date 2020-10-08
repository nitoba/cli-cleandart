  abstract class IStreamStatus {
  Future<void>call();
}


class StreamStatus implements IStreamStatus {
  @override
  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}
  