import 'package:clima/utilities/constants.dart';

class DateModel {
  final epochTime;
  DateTime dateTime;

  DateModel(this.epochTime) {
    dateTime =
        DateTime.fromMillisecondsSinceEpoch(epochTime * 1000, isUtc: true);
  }

  String getWeekday() {
    return kWeekDays[dateTime.weekday - 1];
  }

  String getDay() {
    return dateTime.day.toString();
  }

  String getMonth() {
    return kMonths[dateTime.month - 1];
  }

  int getHour() {
    return dateTime.hour;
  }
}
