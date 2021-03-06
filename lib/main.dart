import 'package:flutter/material.dart';
import 'package:student_attendance/core/app_theme.dart';
import 'package:student_attendance/core/navigation.dart';
import 'package:student_attendance/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationService navigationService = NavigationService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: NavigationService.generateRoute,
      title: 'Student Attendance',
      theme: ThemeData(
        primaryColor: AppTheme.primary,
        primarySwatch: Colors.blue,
        accentColor: AppTheme.accent,
      ),
      home: MainScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   MySqlConnection conn;

//   @override
//   void initState() {
//     super.initState();
//   }

// void testSQL() {
//   var settings = new ConnectionSettings(
//       host: 'localhost',
//       port: 3306,
//       user: 'root',
//       password: 'husain1611',
//       db: 'attendance');
//   MySqlConnection.connect(settings)
//       .then((conn) => conn.query('select * from students').then((results) {
//             for (var row in results) {
//               print(row);
//             }
//           }));
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: DataTableDemo());
//   }
// }
