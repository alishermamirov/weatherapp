class WeatherExceptions implements Exception {
  final String messsage;

  WeatherExceptions(this.messsage);

  @override
  String toString() {
    // TODO: implement toString
    return messsage;
  }
}
