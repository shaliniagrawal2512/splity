import 'dart:math';

import 'package:flutter/material.dart';

const kInputDecoration = InputDecoration(
  errorStyle: TextStyle(color: Color(0xff9D2228), fontSize: 15),
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff9D2228), width: 1.5)),
  focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff9D2228), width: 3.0)),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xff1DCE77), width: 1.5),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xff1DCE77), width: 3.0),
  ),
);

ButtonStyle kStyling =
    ElevatedButton.styleFrom(side: const BorderSide(color: Color(0xff1ec677)));

Decoration kBoxDecoration = BoxDecoration(
  image: DecorationImage(
      colorFilter: ColorFilter.mode(
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
          BlendMode.modulate),
      fit: BoxFit.fill,
      image: const AssetImage("assets/pattern3.jpg")),
  shape: BoxShape.circle,
);

ButtonStyle kStyling2 = ElevatedButton.styleFrom(
    textStyle: const TextStyle(color: Colors.white),
    primary: const Color(0xff362B45),
    side: const BorderSide(color: Color(0xff1ec677), width: 4));

TextStyle kTextStyle1 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle kTextStyle12 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle kTextStyle3 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
