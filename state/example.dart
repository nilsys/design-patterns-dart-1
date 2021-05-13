abstract class LightState {
  void commandHandler(LightSwitcherState state);
  String toStr();
}

class LightSwitcherState {
  LightState _state;

  LightSwitcherState(this._state);

  LightState get state => _state;
  set state(LightState newState) => _state = newState;

  void touch() {
    print("  Touching onto light ");
    _state.commandHandler(this);
  }
}

class LightsOn implements LightState {
  @override
  void commandHandler(LightSwitcherState context) {
    print("[Turn on] method ws called");
    context.state = LightsOff();
  }

  @override
  String toStr() => "Lights On";
}

class LightsOff implements LightState {
  @override
  void commandHandler(LightSwitcherState context) {
    print("[Turn off] method ws called");
    context.state = LightsOff();
  }

  @override
  String toStr() => 'Lights off';
}

void main() {
  // We must to provide a initial status/state
  // And it would be lights off.
  var lightSwitcher = LightSwitcherState(LightsOff());

  print("The light switch is ${lightSwitcher.state}.");
  print("Toggling the light switch...");
  lightSwitcher.touch();
  print("The light switch is ${lightSwitcher.state}.");
}
