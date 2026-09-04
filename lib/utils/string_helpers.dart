extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String titleCase() {
    RegExp regExp = RegExp('\\b[\\w+]+\\b');
    Iterable<Match> matches = regExp.allMatches(this);
    String val = '';
    for (var m in matches) {
      val += '${m[0]!.capitalize()} ';
    }
    return val;
  }
}
