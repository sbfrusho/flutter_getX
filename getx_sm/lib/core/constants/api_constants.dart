class ApiConstants {
  static const String baseUrl = "https://swapi.dev/api";

  //endpoints
  static const String root = '/';
  static const String people = '/people/';
  static const String planets = '/planets/';
  static const String films = '/films/';
  static const String species = '/vehicles/';
  static const vehicles = '/vehicles/';
  static const String starships = '/starships';

  //query parameters 
  static const String page = 'page';
  static const String search = 'search';

  //Timeout
  static const int connectionTimeOut = 30000;
  static const int recieveTimeOut = 30000;

  static const Map<String, String> headers = {
    'content-type' : 'application/json',
    'Accept' : 'application/json'
  };
}