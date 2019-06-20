import 'package:flutter/material.dart';

//If the time is below 7:00 PM it sends the day color, else night color.

AssetImage getBackgroundImage(hour) {
  if (hour < 19 && hour > 5)
    return AssetImage('images/background_day.png');
  else
    return AssetImage('images/background_night.png');
}

Color getAppBarColor(hour) {
  if (hour < 19 && hour > 5)
    return Color(0xFF41BAFA);
  else
    return Color(0xFF0431C1);
}
