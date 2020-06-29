import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF0E3360);
const kDashBColor = Color(0xFF264772);
const kLiveUpdate = Color(0xFFDE555D);
const goLiveUpdate = Color(0xFF);
const kSymptomsColor = Color(0xFF0C213E);
const learnMore = Color(0xFF233750);

final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');

final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");