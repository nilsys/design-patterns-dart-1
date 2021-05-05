enum City { Istanbul, Tbilisi, Baku, Zakatala }

abstract class Cargo {
  Set<City> citys;
  Cargo _nextCity;

  Cargo({this.citys});

  bool get willCargoToAllCities => citys.contains(City.values);
  set nextCity(nextCity) => _nextCity = nextCity;

  void addCity(City city) => citys.add(city);

  // Method to take message and put it onto log.
  void write_message(String msg);

  //
  void log(City city, String msg) {
    if (citys.contains(city) || willCargoToAllCities) {
      write_message(msg);
    }
    _nextCity?.log(city, msg);
  }
}

class LogIstanbul extends Cargo {
  LogIstanbul(Set<City> citys) : super(citys: citys);

  @override
  void write_message(String msg) => print('[Istanbul] $msg');
}

class LogBaku extends Cargo {
  LogBaku(Set<City> citys) : super(citys: citys);

  @override
  void write_message(String msg) => print('[Baku] $msg');
}

class LogTbilisi extends Cargo {
  LogTbilisi(Set<City> citys) : super(citys: citys);

  @override
  void write_message(String msg) => print('[Tbilisi] $msg');
}

class LogZakatala extends Cargo {
  LogZakatala(Set<City> citys) : super(citys: citys);

  @override
  void write_message(String msg) => print('[Zakatala] $msg');
}

void main() {
  print('===== Chain of Responsibility =====');

  var istanbulLogger = LogIstanbul(Set.from(City.values));
  var tbilisiLogger = LogTbilisi({City.Tbilisi, City.Zakatala, City.Istanbul});
  var bakuLogger = LogBaku({City.Baku, City.Istanbul, City.Zakatala});
  var zakatalaLogger = LogZakatala({City.Zakatala, City.Baku, City.Tbilisi});

  istanbulLogger.nextCity = tbilisiLogger;
  tbilisiLogger.nextCity = bakuLogger;
  bakuLogger.nextCity = zakatalaLogger;

  print(istanbulLogger.citys);
  print(tbilisiLogger.citys);
  print(bakuLogger.citys);
  print(zakatalaLogger.citys);
  print('===================================');
}
