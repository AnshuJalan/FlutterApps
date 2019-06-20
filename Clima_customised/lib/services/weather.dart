import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const api_key = 'c48371cc386a2019ea5416696715e95a';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getCityWeatherData(String city) async {
    var url = "$openWeatherURL?q=$city&appid=$api_key&units=metric";

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future getWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$api_key&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☂';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int condition) {
    if (condition < 300) {
      return 'THUNDERSTORM';
    } else if (condition < 400) {
      return 'DRIZZLE';
    } else if (condition < 600) {
      return 'RAIN';
    } else if (condition < 700) {
      return 'SNOW';
    } else if (condition < 800) {
      return 'HAZE';
    } else if (condition == 800) {
      return 'CLEAR';
    } else if (condition <= 804) {
      return 'CLOUDY';
    } else
      return 'UNKNOWN';
  }
}
