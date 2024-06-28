extension StringExtensions on String {
  String capitalizaString() => "${this[0].toUpperCase()}${this.substring(1)}";
}
