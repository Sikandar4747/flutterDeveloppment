import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const kApiKey = 'e65d4df814df58c0f2d8eafde881afa8';
const kOpenweatherUrl = 'https://api.openweathermap.org/data/2.5/onecall';
const kOpenWeather = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  int lat;
  int lon;
  Future<dynamic> getCityCountrySearch(String cityName) async {
    var url = '$kOpenWeather?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(double lat, double lon) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenweatherUrl?lat=$lat&lon=$lon&exclude=minutely,alerts&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityCountry(double lat, double lon) async {
    var url = '$kOpenWeather?lat=$lat&lon=$lon&appid=$kApiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenweatherUrl?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely,alerts&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
