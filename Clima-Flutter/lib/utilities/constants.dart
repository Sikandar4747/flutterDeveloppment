import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 55.0,
  fontWeight: FontWeight.w600,
);
const kSun = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);
const kWindStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
);
const kValueStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
