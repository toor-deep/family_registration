import 'package:flutter/material.dart';

import '../core/routing.dart';


void showSnackbar(String? text,Color? color) {
  ScaffoldMessenger.of(appNavigationKey.currentContext!).clearSnackBars();

  ScaffoldMessenger.of(appNavigationKey.currentContext!)
      .showSnackBar(SnackBar(content: Text('$text'),backgroundColor: color,));
}

