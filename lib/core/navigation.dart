import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_attendance/screens/home/lecture_details_screen.dart';

class NavigationService extends AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  void goBack() => navigatorKey.currentState.pop();

  @override
  void push(String route, {bool shouldReplace = false, Object arguments}) =>
      shouldReplace
          ? navigatorKey.currentState
              .pushReplacementNamed(route, arguments: arguments)
          : navigatorKey.currentState.pushNamed(route, arguments: arguments);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigation.routeLectureDetails:
        return MaterialPageRoute(
            builder: (_) => LectureDetails(), settings: settings);
      default:
        return null;
    }
  }
}

abstract class AppNavigation {
  static const String routeHome = '/home';
  static const String routeAccount = '/account';
  static const String routeSettings = '/settings';
  static const String routeLectureDetails = '/lecture';
  static const String routeNewLecture = '/new_lecture';
  void goBack();
  void push(String route);
}
