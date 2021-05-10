abstract class Dash {
  IFly flyInterface;
  IWalk walkIntarface;

  Dash(this.flyInterface, this.walkIntarface);

  setFlyBehavior(IFly newFlyStrategy) => this.flyInterface = newFlyStrategy;
  setWalkBehavior(IWalk newWalkStrategy) =>
      this.walkIntarface = newWalkStrategy;

  void fly() => flyInterface.fly;
  void walk() => walkIntarface.walk;
  void display();
}

// In there "I" means "Interface".
abstract class IFly {
  void fly();
}

// In there "I" means "Interface".
abstract class IWalk {
  void walk();
}

// Subclasses:
class FlyFast implements IFly {
  @override
  void fly() => print("Fast flying...");
}

class FlySlow implements IFly {
  @override
  void fly() => print("Slow flying...");
}

class WalkWithJumping implements IWalk {
  @override
  void walk() => print("Walking with jumping...");
}

class JustWalk implements IWalk {
  @override
  void walk() => print('Just walking...');
}

// Our custom dashes:
class DashIskaa extends Dash {
  DashIskaa(IFly flyInterface, IWalk walkIntarface)
      : super(flyInterface, walkIntarface);

  @override
  void display() => print("Hi i'm DashIskaa");

  @override
  void fly() => print("Dashiskaa is flying... ${flyInterface.runtimeType}");

  @override
  void walk() => print("Dashiskaa is walking... ${walkIntarface.runtimeType}");
}

void main() {
  IFly fastFly = FlyFast();
  IFly slowFly = FlySlow();
  IWalk walkWithJ = WalkWithJumping();
  IWalk justWalk = JustWalk();

  // Create a dash and do some acts.
  Dash dashIskaa = DashIskaa(fastFly, justWalk);
  dashIskaa.display();
  dashIskaa.walk();
  dashIskaa.fly();

  // Change behavior of DashIskaa at runtime.
  dashIskaa.setFlyBehavior(slowFly);
  dashIskaa.setWalkBehavior(walkWithJ);
  dashIskaa.walk();
  dashIskaa.fly();
}
