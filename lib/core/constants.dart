import 'package:flutter/material.dart';

const Color kPrimaryTextColor = Color(0xFFF5F5F5);
const Color kGhibliColor = Color(0XFF0E8FE2);  

const LinearGradient kAppBarGradient = LinearGradient(
  colors: [Colors.blue, Colors.grey], 
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const TextStyle kAppBarTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontWeight: FontWeight.bold,
);

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: kPrimaryTextColor,
);

const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kPrimaryTextColor,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 16,
  color: kPrimaryTextColor,
);

const TextStyle kFilmDescriptionTextStyle = TextStyle(
  fontSize: 16,
  color: kPrimaryTextColor,
);

