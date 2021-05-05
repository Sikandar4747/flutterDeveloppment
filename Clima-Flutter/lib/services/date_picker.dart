class DatePicker {
  DatePicker(this.time) {}
  int time;

  String getWeekday() {
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

  String getMonthName() {
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
      return 'July';
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
