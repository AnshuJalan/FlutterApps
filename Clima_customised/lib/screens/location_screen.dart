import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'package:clima/services/date_time.dart';
import 'package:clima/utilities/theme_control.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  DateModel dateModel;
  int temperature;
  String weatherIcon;
  String city;
  String weatherMessage;
  AssetImage assetImage;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        dateModel = DateModel(0);
        temperature = 0;
        weatherIcon = 'Error';
        city = '';
        weatherMessage = 'Unable to get weather data.';
        return;
      }

      dateModel = DateModel(weatherData['dt'] + weatherData['timezone']);
      temperature = weatherData['main']['temp'].toInt();
      weatherIcon =
          weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
      city = weatherData['name'];
      weatherMessage = weatherModel.getMessage(weatherData['weather'][0]['id']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CLIMA',
          style: kAppBarTextStyle,
        ),
        backgroundColor: getAppBarColor(dateModel.getHour()),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.home),
            onPressed: () async {
              var cityName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityScreen(dateModel.getHour())));

              if (cityName != null) {
                var weatherData =
                    await weatherModel.getCityWeatherData(cityName);
                updateUI(weatherData);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.near_me),
            iconSize: 30,
            onPressed: () async {
              var weatherData = await weatherModel.getWeatherData();
              updateUI(weatherData);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: getBackgroundImage(dateModel.getHour()),
            fit: BoxFit.cover,
            //colorFilter: ColorFilter.mode(
            //  Colors.white.withOpacity(0.25), BlendMode.srcATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    dateModel.getWeekday(),
                    style: kWeekDayStyle,
                  ),
                  SizedBox(
                    height: 5,
                    width: 50,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${dateModel.getDay()} ${dateModel.getMonth()}",
                    style: kDayMonthStyle,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '$weatherIcon',
                    style: kConditionTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '$city',
                    style: kCityTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$weatherMessage",
                    style: kMessageTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
