
import 'package:cilma_app/services/location.dart';
import 'package:cilma_app/services/networking.dart';

const apiKey = 'bb2b320a3caff76133442224598c6700';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&units=metric&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData= await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if(temp> 40){
      return 'Hyy garmi 🥵';
    }else if (temp > 35) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp < 18) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
