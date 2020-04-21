
import 'package:flutter/material.dart';
import 'package:urbanbus/pages/home_page.dart';
import 'package:urbanbus/pages/map_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return  <String, WidgetBuilder>{
    'logeo': (BuildContext context) => MyHomePage(),
      'map': (BuildContext context) => MapPage(),

  };
}