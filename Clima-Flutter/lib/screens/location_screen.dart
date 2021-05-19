import 'package:clima/screens/forecast_screen.dart';
import 'package:clima/services/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  final cityFul;
  final countryFul;
  LocationScreen({this.locationWeather, this.cityFul, this.countryFul});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature = 0;
  int feelsLike = 0;
  String country = ' ';
  var dailyData;
  String iconWeather = ' ';
  String city = ' ';
  String weatherMessage = ' ';
  int visibilityD = 0;
  int wind = 0;
  int humidity = 0;
  String description = ' ';
  var hourData;
  String sunRise = '';
  String sunSet = '';
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    updateUI(widget.locationWeather, widget.cityFul, widget.countryFul);

    super.initState();
  }

  void updateUI(dynamic weatherData, String cityFul, String countryFul) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherMessage = 'Unable to get weather';
        city = '  ';
        return;
      }
      DatePicker datePicker = DatePicker();
      var sr = weatherData['current']['sunrise'];
      sunRise = '${datePicker.hour(sr)}: ${datePicker.minute(sr)}';
      var ss = weatherData['current']['sunset'];
      sunSet = '${datePicker.hour(ss)}: ${datePicker.minute(ss)}';
      var temp = weatherData['current']['temp'];
      temperature = temp.toInt();
      var windD = weatherData['current']['wind_speed'];
      wind = windD.toInt();
      city = cityFul;
      country = countryFul;
      visibilityD = weatherData['current']['visibility'];
      hourData = weatherData['hourly'];
      humidity = weatherData['current']['humidity'];
      iconWeather = weatherData['current']['weather'][0]['icon'];
      description = weatherData['current']['weather'][0]['main'];
      var feels = weatherData['current']['feels_like'];
      feelsLike = feels.toInt();
      dailyData = weatherData['daily'];
      weatherMessage = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF103243),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () async {
                        var weatherData =
                            await weatherModel.getLocationWeather();
                        var cityCountry = await weatherModel.getCityCountry(
                            weatherData['lat'], weatherData['lon']);
                        updateUI(weatherData, cityCountry['name'],
                            cityCountry['sys']['country']);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 35.0,
                      ),
                    ),
                    Text(
                      '$city,$country',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                        print(typedName);
                        if (typedName != null) {
                          var cityCountry = await weatherModel
                              .getCityCountrySearch(typedName);
                          var lat = cityCountry['coord']['lat'];
                          var lon = cityCountry['coord']['lon'];
                          var weatherData =
                              await weatherModel.getCityWeather(lat, lon);

                          updateUI(weatherData, cityCountry['name'],
                              cityCountry['sys']['country']);
                        }
                      },
                      child: Icon(
                        Icons.location_searching_outlined,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.network(
                            'http://openweathermap.org/img/wn/$iconWeather@2x.png',
                          ),
                          Text(
                            description,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Column(
                          children: [
                            Text(
                              '$temperature°',
                              style: kTempTextStyle,
                            ),
                            Text(
                              'Feels Like $feelsLike',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 20.0,
                    top: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    weatherMessage,
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: 20.0, left: 20.0, right: 20.0, top: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Wind',
                            style: kWindStyle,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '${wind}m/s',
                            style: kValueStyle,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Humidity',
                            style: kWindStyle,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '$humidity%',
                            style: kValueStyle,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Visibility',
                            style: kWindStyle,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '$visibilityD',
                            style: kValueStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today',
                                style: kValueStyle,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ForecastScreen(
                                        dailyData, city, country);
                                  }));
                                },
                                child: Text(
                                  'Next Week >',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 3.0,
                        ),
                        Container(
                          height: 105.0,
                          padding: EdgeInsets.only(top: 5.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < 24; i++)
                                HourlyWidget(hourData[i]),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 3.0,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sunrise $sunRise',
                              style: kSun,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Sunset $sunSet',
                              style: kSun,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyWidget extends StatelessWidget {
  final hourlyData;
  HourlyWidget(this.hourlyData);
  @override
  Widget build(BuildContext context) {
    DatePicker datePicker = DatePicker();
    return Column(
      children: [
        Image.network(
            'http://openweathermap.org/img/wn/${hourlyData['weather'][0]['icon']}.png'),
        Text('${datePicker.hour(hourlyData['dt'])}: 00'),
        Text('${hourlyData['temp'].toInt()}°'),
      ],
    );
  }
}
