// import 'package:clima/screens/details_screen.dart';
import 'package:clima/services/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ForecastScreen extends StatelessWidget {
  final daily;
  final city;
  final country;
  ForecastScreen(this.daily, this.city, this.country);
  @override
  Widget build(BuildContext context) {
    DatePicker datePicker = DatePicker();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color(0xFF103243),
              child: Container(
                color: Colors.blueAccent,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                    Center(
                      child: Text(
                        '$city,$country',
                        style: kSun,
                      ),
                    ),
                    Text(
                      '............',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'Next Week Forecast',
                textAlign: TextAlign.center,
                style: kSun,
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 1; i < 8; i++)
                      DailyWIdget(daily: daily, i: i, datePicker: datePicker),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DailyWIdget extends StatelessWidget {
  const DailyWIdget({
    Key key,
    @required this.daily,
    @required this.i,
    @required this.datePicker,
  }) : super(key: key);

  final daily;
  final int i;
  final DatePicker datePicker;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      margin: EdgeInsets.only(bottom: 3.0),
      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                            'http://openweathermap.org/img/wn/${daily[i]['weather'][0]['icon']}.png'),
                        Text(
                          '${datePicker.getWeekday(daily[i]['dt'])}, ${datePicker.getDay(daily[i]['dt'])} ${datePicker.getMonthName(daily[i]['dt'])}',
                        ),
                      ],
                    ),
                    Text(
                        '${daily[i]['temp']['max'].toInt()}°/${daily[i]['temp']['min'].toInt()}°')
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('wind: ${daily[i]['wind_speed'].toInt()}m/s'),
              ),
              Text('Humidity: ${daily[i]['humidity']}%'),
            ],
          ),
        ],
      ),
    );
  }
}
// Container(
// height: 200.0,
// width: double.infinity,
// color: Colors.blueAccent,
// child: TextButton(
// onPressed: () {
// showModalBottomSheet(
// context: context,
// builder: (context) => DetailsScreen(),
// );
// },
// child: Text('I am a god'),
// ),
// ),
