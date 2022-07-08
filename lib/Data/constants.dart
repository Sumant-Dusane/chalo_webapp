import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(251,174,31, 1);
const kTextColor = Color.fromRGBO(0, 0, 0, 1);
const kSecondaryColor = Color.fromRGBO(21, 21, 21, 1);
bool isVisible = false;
bool flagList = true;

Map<int, Color> color =
const {
  50:Color.fromRGBO(251,174,31, .1),
  100:Color.fromRGBO(251,174,31, .2),
  200:Color.fromRGBO(251,174,31, .3),
  300:Color.fromRGBO(251,174,31, .4),
  400:Color.fromRGBO(251,174,31, .5),
  500:Color.fromRGBO(251,174,31, .6),
  600:Color.fromRGBO(251,174,31, .7),
  700:Color.fromRGBO(251,174,31, .8),
  800:Color.fromRGBO(251,174,31, .9),
  900:Color.fromRGBO(251,174,31, 1),
};



MaterialColor kPrimarySwatch = MaterialColor(const Color.fromRGBO(251,174,31, 1).value, color);