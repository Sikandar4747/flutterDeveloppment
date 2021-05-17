class DatePicker {
  String getWeekday(int time) {
    var data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    if (data.weekday == 1) {
      return 'Monday';
    } else if (data.weekday == 2) {
      return 'Tuesday';
    } else if (data.weekday == 3) {
      return 'Wednesday';
    } else if (data.weekday == 4) {
      return 'Thursday';
    } else if (data.weekday == 5) {
      return 'Friday';
    } else if (data.weekday == 6) {
      return 'Saturday';
    } else if (data.weekday == 7) {
      return 'Sunday';
    } else {
      return 'Error';
    }
  }

  String hour(int time) {
    var data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String hour;
    hour = '${data.hour}';
    if (hour == '1') {
      return '01';
    } else if (hour == '2') {
      return '02';
    } else if (hour == '3') {
      return '03';
    } else if (hour == '4') {
      return '04';
    } else if (hour == '5') {
      return '05';
    } else if (hour == '6') {
      return '06';
    } else if (hour == '7') {
      return '07';
    } else if (hour == '8') {
      return '08';
    } else if (hour == '9') {
      return '09';
    } else {
      return hour;
    }
  }

  String minute(int time) {
    var data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String hour;
    hour = '${data.minute}';
    if (hour == '1') {
      return '01';
    } else if (hour == '2') {
      return '02';
    } else if (hour == '3') {
      return '03';
    } else if (hour == '4') {
      return '04';
    } else if (hour == '5') {
      return '05';
    } else if (hour == '6') {
      return '06';
    } else if (hour == '7') {
      return '07';
    } else if (hour == '8') {
      return '08';
    } else if (hour == '9') {
      return '09';
    } else {
      return hour;
    }
  }

  String getDay(int time) {
    var data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return data.day.toString();
  }

  String getMonthName(int time) {
    var data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    if (data.month == 1) {
      return 'Jan';
    } else if (data.month == 2) {
      return 'Feb';
    } else if (data.month == 3) {
      return 'Mar';
    } else if (data.month == 4) {
      return 'Apr';
    } else if (data.month == 5) {
      return 'May';
    } else if (data.month == 6) {
      return 'Jun';
    } else if (data.month == 7) {
      return 'Jul';
    } else if (data.month == 8) {
      return 'Aug';
    } else if (data.month == 9) {
      return 'Sep';
    } else if (data.month == 10) {
      return 'Oct';
    } else if (data.month == 11) {
      return 'Nov';
    } else if (data.month == 12) {
      return 'Dec';
    } else {
      return 'Error';
    }
  }
}
