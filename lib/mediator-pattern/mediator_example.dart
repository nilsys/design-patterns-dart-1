abstract class Stateful {
  String _state;
  String get state => _state;

  set setState(String newState) => _state = newState;
}

class Mediator {
  List<Stateful> parties;
  Mediator(this.parties);

  void update(String state) {
    for (var party in parties) {
      party.setState = state;
    }
  }
}

class Attend extends Stateful {
  String name;
  Attend(this.name);
}

void main() {
  var ismael = Attend('Ismael');
  var luka = Attend('Luka');

  var mixer = List<Attend>.from([ismael, luka]);
  var announcementSystem = Mediator(mixer);

  announcementSystem.update("Don't waste time!");

  for (var person in mixer) {
    print('Advice for: ${person.name}\ - "${person.state}\"');
  }
}
