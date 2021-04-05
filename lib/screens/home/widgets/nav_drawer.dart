import 'package:flutter/material.dart';
import 'package:student_attendance/core/app_theme.dart';
import 'package:student_attendance/core/navigation.dart';
import 'package:student_attendance/models/screens.dart';

class NavigationDrawer extends StatefulWidget {
  final Screen currentScreen;
  const NavigationDrawer({this.currentScreen});

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            arrowColor: AppTheme.accent,
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppTheme.secondary,
              child: Icon(
                Icons.account_circle_outlined,
                color: AppTheme.white,
                size: 50,
              ),
            ),
            accountName: Text('Student'),
            accountEmail: Text('student@somaiya.edu'),
          ),
          ...Screen.list.map((screen) {
            final bool isSelected = widget.currentScreen.type == screen.type;
            return Card(
                color: AppTheme.accent,
                elevation: 10,
                child: ListTile(
                  onTap: () {
                    setState(() => Screen.changeScreen(screen));
                    NavigationService().goBack();
                  },
                  title: Text(
                    screen.label,
                    style: TextStyle(color: AppTheme.white),
                  ),
                  leading: Icon(
                    isSelected ? screen.activeIcon : screen.icon,
                    size: isSelected ? 30 : null,
                    color: isSelected ? AppTheme.secondary : AppTheme.white,
                  ),
                ));
          }),
        ],
      ),
    );
  }
}
