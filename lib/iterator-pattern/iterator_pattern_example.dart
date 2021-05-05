// https://api.dartlang.org/stable/2.4.0/dart-core/Iterator-class.html

class ProgramingLangIterator implements Iterator {
  int _index = 0;

  final List<String> _languages = [
    'Dart',
    'Javascript',
    'Swift',
    'Rust',
    'Kotlin'
  ];

  @override
  String get current => _languages[_index++];

  @override
  bool moveNext() => _index < _languages.length;
}

void main() {
  print('========= Iterator pattern =========');
  var programingLangIterator = ProgramingLangIterator();
  while (programingLangIterator.moveNext()) {
    print(programingLangIterator.current);
  }
  print('==================================');
}
