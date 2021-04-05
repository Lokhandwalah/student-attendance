import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_attendance/screens/account/account_screen.dart';
import 'package:student_attendance/screens/home/home_screen.dart';
import 'package:student_attendance/screens/settings_screen.dart';

import 'enums.dart';

class Screen {
  final Widget page;
  final Screens type;
  final String label;
  final int index;
  final IconData icon, activeIcon;

  Screen({
    @required this.label,
    @required this.icon,
    @required this.index,
    @required this.activeIcon,
    @required this.page,
    @required this.type,
  });

  static StreamController<Screen> streamController;

  static Screen home = Screen(
    label: 'Home',
    type: Screens.Home,
    icon: Icons.home_outlined,
    activeIcon: Icons.home,
    index: 0,
    page: HomeScreen(),
  );

  static Screen account = Screen(
      label: 'Account',
      type: Screens.Account,
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      index: 1,
      page: AccountScreen());

  static Screen settings = Screen(
      label: 'Settings',
      type: Screens.Settings,
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      index: 2,
      page: SettingsScreen());

  static List<Screen> list = <Screen>[
    home,
    account,
    settings,
  ];

  static void init() {
    streamController = StreamController();
    streamController.add(home);
  }

  static void changeScreen(Screen screen) {
    streamController.add(screen);
  }

  static void dispose() {
    streamController.close();
  }
}
