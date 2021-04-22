import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_attendance/core/navigation.dart';
import 'package:student_attendance/models/screens.dart';
import 'package:student_attendance/screens/nav_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Screen.init();
  }

  @override
  void dispose() {
    Screen.dispose();
    super.dispose();
  }

  DateTime currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Screen>(
        stream: Screen.streamController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          Screen screen = snapshot.data;
          return WillPopScope(
            onWillPop: () => onWillPop(screen.index),
            child: Scaffold(
              key: _scaffoldKey,
              drawer: NavigationDrawer(currentScreen: screen),
              body: IndexedStack(
                children: Screen.list.map((screen) => screen.page).toList(),
                index: screen.index,
              ),
            ),
          );
        });
  }

  Future<bool> onWillPop(int index) {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      NavigationService().goBack();
      return null;
    }
    if (index == 0) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: 'Press Back again to Exit');
        return Future.value(false);
      }
      return Future.value(true);
    } else {
      Screen.changeScreen(Screen.home);
      return Future.value(false);
    }
  }
}
