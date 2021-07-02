import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(

  fontSize: 30.0,
  fontWeight: FontWeight.w300,

);

const kMessageTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  backgroundColor: Colors.grey,
);

const kConditionTextStyle = TextStyle(
  fontSize: 120.0,
);

const kTextFieldInputDecor = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city, color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0
      ),
      ),
      borderSide: BorderSide.none,
    )
);

