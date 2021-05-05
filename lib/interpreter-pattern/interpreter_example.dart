abstract class Expression {
  Number number;
  void interpret(double value);
}

class Number {
  double value;
  Number(double value) {
    print('Initial value is: $value');
    this.value = value;
  }
}

class Plus implements Expression {
  @override
  Number number;

  Plus(this.number);

  @override
  void interpret(double value) {
    print('Adding - $value to initial value (${number.value}) ');
    number.value += value;
  }
}

class Subtract implements Expression {
  @override
  Number number;

  Subtract(this.number);

  @override
  void interpret(double value) {
    print('Subtracting - $value with initial value (${number.value}) ');
    number.value -= value;
  }
}

class Divide implements Expression {
  @override
  Number number;
  Divide(this.number);
  @override
  void interpret(double value) {
    print('Dividing - $value with initial value (${number.value}) ');
    number.value /= value;
  }
}

class Multiply implements Expression {
  @override
  Number number;
  Multiply(this.number);

  @override
  void interpret(double value) {
    print('Multiplying - $value with initial value (${number.value}) ');
    number.value *= value;
  }
}

void main() {
  print('========= Interpreter pattern =========');
  var number = Number(0);
  var plusserFun = Plus(number);
  var subtracterFun = Subtract(number);
  var dividerFun = Divide(number);
  var multiplierFun = Multiply(number);

  plusserFun.interpret(10);
  subtracterFun.interpret(5);
  dividerFun.interpret(2);
  multiplierFun.interpret(9);
  print('==================================');
}
