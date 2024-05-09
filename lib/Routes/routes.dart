import 'package:flutter/material.dart';
import 'package:weight_tracker/Screens/homeScreen/home_screen.dart';
import 'package:weight_tracker/Screens/homeScreen/home_screen_view.dart';
import 'package:weight_tracker/Screens/sign_up.dart';
import 'package:weight_tracker/Screens/sign_in.dart';
import 'package:weight_tracker/Screens/starting_screen.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    var route = <String, WidgetBuilder>{
      "/": (BuildContext context) => StartingScreen(),
      "/signin": (BuildContext context) => SignInScreen(),
      "/signup": (BuildContext context) => SignUpScreen(),
      "/homescreenview" : (BuildContext context) => HomeScreenView(),
    };
    return route;
  }
}