import 'package:flutter/material.dart';

//Font Styles

const kTempTextStyle = TextStyle(
  fontFamily: 'NotoSans',
  fontWeight: FontWeight.w700,
  fontSize: 100.0,
);

const kAppBarTextStyle = TextStyle(
  fontFamily: 'NotoSans',
  fontSize: 25,
);

const kCityTextStyle = TextStyle(
  fontFamily: 'Bitter',
  fontSize: 60,
);

const kWeekDayStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 35.0,
);

const kDayMonthStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 20,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 25,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputDecorationStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter the city",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

const kWeekDays = [
  'MONDAY',
  'TUESDAY',
  'WEDNESDAY',
  'THURSDAY',
  'FRIDAY',
  'SATURDAY',
  'SUNDAY'
];

const kMonths = [
  'JANUARY',
  'FEBRUARY',
  'MARCH',
  'APRIL',
  'MAY',
  'JUNE',
  'JULY',
  'AUGUST',
  'SEPTEMBER',
  'OCTOBER',
  'NOVEMBER',
  'DECEMBER'
];
