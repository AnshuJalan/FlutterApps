import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/theme_control.dart';

double latitude, longitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getWeatherData();
    AlertDialog(title: Text('reached here1'));
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(weatherData)));

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CLIMA',
          style: kAppBarTextStyle,
        ),
        backgroundColor: getAppBarColor(DateTime.now().hour),
      ),
      body: Center(
        child: SpinKitRing(color: Colors.red, size: 50),
      ),
    );
  }
}
