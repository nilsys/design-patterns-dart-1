class Calculator {
  bool enableOtoLog;
  double value;
  final List _history = [];

  Calculator({this.value = 0, this.enableOtoLog = true});

  void _print() {
    var _printableValue = value.toString().replaceAll('.0', '');
    if (enableOtoLog) print(_printableValue);
  }

  void undo() {
    var lastCommand = _history.last;
    _history.remove(lastCommand);
    value = lastCommand.undo(value);
    _print();
  }

  void add(Command command) {
    value = command.plus(value);
    _history.add(command);
    _print();
  }

  void subtract(Command command) {
    value = command.minus(value);
    _history.add(command);
    _print();
  }

  void multiply(Command command) {
    value = command.multiply(value);
    _history.add(command);
    _print();
  }

  void divide(Command command) {
    value = command.divide(value);
    _history.add(command);
    _print();
  }
}

class Command {
  double valueToAct;
  Command(this.valueToAct);

  double undo(double currentValue) => currentValue - valueToAct;

  double plus(double currentValue) => currentValue + valueToAct;

  double minus(double currentValue) => currentValue - valueToAct;

  double divide(double currentValue) => currentValue / valueToAct;

  double multiply(double currentValue) => currentValue * valueToAct;
}

void main() {
  print('========= Command pattern =========');
  var calculator = Calculator();
  calculator.add(Command(15));
  calculator.undo();
  calculator.subtract(Command(25));
  calculator.divide(Command(2));
  calculator.undo();
  calculator.multiply(Command(80));

  print('==================================');

  // The output should be:
  /*
    15
    0
    -25
    -12.5
    -14.5
    -1160
  */
}
