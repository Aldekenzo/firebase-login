import 'package:flutter/material.dart';

final defaultShadow = BoxShadow(
  color: Colors.black.withOpacity(0.07),
  offset: Offset(0.0, 5.0), //(x,y)
  blurRadius: 15.0,
  spreadRadius: 0.0,
);

final defaultBottomSheetShadow = BoxShadow(
  color: Colors.black.withOpacity(0.07),
  offset: Offset(0.0, -5.0), //(x,y)
  blurRadius: 15.0,
  spreadRadius: 0.0,
);
