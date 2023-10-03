import 'dart:math';

extension CamelCaseString on String {
  String toCamelCase() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

extension ConvertLength on int {
  String toMB() {
    if (this == 00) return "(?) MB";
    if (this <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }
}
