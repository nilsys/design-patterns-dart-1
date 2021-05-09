abstract class Hoagie {
  bool customerWantsMeat;
  bool customerWantsCheese;
  bool customerWantsVegetables;

  Hoagie({
    this.customerWantsMeat = true,
    this.customerWantsCheese = true,
    this.customerWantsVegetables = true,
  });

  void makeSandwich() {
    cutBun();

    if (customerWantsMeat) {
      addMeat();
    }
    {
      print("Meat wasn't added beacuse customer didn't want that");
    }

    if (customerWantsCheese) {
      addCheese();
    } else {
      print("Cheese wasn't added beacuse customer didn't want that");
    }

    if (customerWantsVegetables) {
      addVegetables();
    }

    wrapTheHoagie();

    print('The Sandwich is ready!');
  }

  void cutBun() {
    print('Cut hoagie');
  }

  void addMeat() {
    print('Add some meats to sandwich');
  }

  void addCheese() {
    print('Add some cheeses to sandwich');
  }

  void addVegetables() {
    print('Add some vegetables to sandwich');
  }

  void wrapTheHoagie() {
    print('Wrap the hoagie');
  }
}

class ItalianResturant extends Hoagie {
  @override
  set customerWantsCheese(bool _customerWantsCheese) {
    super.customerWantsCheese = _customerWantsCheese;
  }

  @override
  set customerWantsMeat(bool _customerWantsMeat) {
    super.customerWantsMeat = _customerWantsMeat;
  }

  @override
  set customerWantsVegetables(bool _customerWantsVegetables) {
    super.customerWantsVegetables = _customerWantsVegetables;
  }

  @override
  void cutBun() {
    print('- bun was cutted');
  }

  @override
  void addMeat() {
    print('- meat was added');
  }

  @override
  void addCheese() {
    print('- cheese was added');
  }

  @override
  void addVegetables() {
    print('- vegetables were added');
  }

  @override
  void wrapTheHoagie() {
    print('Hoagie was wrapped');
  }
}

void main() {
  var italianResturant = ItalianResturant();
  italianResturant.customerWantsCheese = false;

  italianResturant.makeSandwich();
}
