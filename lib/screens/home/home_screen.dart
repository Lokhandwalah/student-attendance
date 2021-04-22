import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/core/app_theme.dart';
import 'package:student_attendance/core/navigation.dart';
import 'package:student_attendance/models/lecture.dart';
import 'package:student_attendance/screens/home/widgets/lecture_card.dart';

import 'widgets/lecture_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  DateTime currentDateTime = DateTime.now();
  Animation fadeIn, fadeOut;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    Lecture.init(DateTime.now().weekday);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    fadeIn = Tween<double>(begin: 0, end: 1).animate(animationController);
    fadeOut = Tween<double>(begin: 1, end: 0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  final List<String> weekDays = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            title: const Text('Home'),
            leading: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Icon(Icons.menu)),
            actions: [_buildPopupMenuButton()],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.gradient,
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Welcome, Student',
                      style: TextStyle(color: AppTheme.white, fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppTheme.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                            DateFormat('EEEE, MMMM dd').format(currentDateTime),
                            style:
                                TextStyle(color: AppTheme.white, fontSize: 20)),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Chip(
                      backgroundColor:
                          DateFormat.EEEE().format(currentDateTime) ==
                                  weekDays[index]
                              ? AppTheme.secondary
                              : AppTheme.accent,
                      label: Text(weekDays[index]),
                    ),
                  );
                },
                itemCount: weekDays.length,
              ),
            ),
          ),
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: Lecture.todayLectures.length,
            itemBuilder: (context, index, animation) {
              final lect = Lecture.todayLectures[index];
              return GestureDetector(
                onTap: () => NavigationService().push(
                    AppNavigation.routeLectureDetails,
                    arguments: LectureDetailsParams(
                        date: DateTime.now(), lecture: lect)),
                // onDoubleTap: () {
                //   _listKey.currentState.removeItem(
                //     index,
                //     (context, animation) => FadeTransition(
                //       opacity: animation,
                //       child: Container(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 8.0, horizontal: 2.0),
                //         child: Card(
                //           elevation: 10,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20)),
                //           child: Container(
                //             width: double.infinity,
                //             height: getScreenHeight(context) * 0.25,
                //           ),
                //         ),
                //       ),
                //     ),
                //   );
                //   setState(() => Lecture.removeLec(lect));
                // },
                child: LectureCard(lect),
              );
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 50),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: AppTheme.white),
        onPressed: () => Fluttertoast.showToast(msg: 'Add Button Tapped'),
      ),
    );
  }

  PopupMenuButton<String> _buildPopupMenuButton() {
    return PopupMenuButton<String>(onSelected: (value) {
      print(value);
      Fluttertoast.showToast(msg: 'Selected $value');
    }, itemBuilder: (_) {
      return <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          child: Text('Option 1'),
          value: 'Option 1',
        ),
        PopupMenuItem<String>(
          child: Text('Option 2'),
          value: 'Option 2',
        ),
        PopupMenuItem<String>(
          child: Text('Option 3'),
          value: 'Option 3',
        )
      ];
    });
  }
}
