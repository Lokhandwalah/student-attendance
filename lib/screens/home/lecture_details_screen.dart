import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/core/app_theme.dart';
import 'package:student_attendance/core/navigation.dart';
import 'package:student_attendance/models/enums.dart';
import 'package:student_attendance/models/lecture.dart';
import 'package:student_attendance/models/student.dart';
import 'package:student_attendance/screens/home/widgets/lecture_card.dart';
import 'package:student_attendance/screens/home/widgets/lecture_detail.dart';

class LectureDetailsPage extends StatefulWidget {
  final LectureDetailsParams params;
  const LectureDetailsPage(this.params);
  @override
  _LectureDetailsPageState createState() => _LectureDetailsPageState();
}

class _LectureDetailsPageState extends State<LectureDetailsPage> {
  Lecture lecture;
  DateTime date;

  @override
  void initState() {
    super.initState();
    lecture = widget.params.lecture;
    date = widget.params.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.white,
            expandedHeight: 300,
            pinned: true,
            iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
            title:
                Text('Lecture Details', style: TextStyle(color: Colors.black)),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).padding.top +
                                  AppBar().preferredSize.height),
                          Hero(
                            tag: lecture.id + lecture.subject.name,
                            child: LectureDetail(
                                icon: Icons.menu_book_outlined,
                                title: 'Subject',
                                content: lecture.subject.name,
                                iconColor: Colors.deepPurple.shade300),
                          ),
                          Hero(
                            tag: lecture.id + lecture.faculty.name,
                            child: LectureDetail(
                                icon: Icons.person_outline,
                                title: 'Faculty',
                                content: lecture.faculty.name,
                                iconColor: Colors.cyan.shade300),
                          ),
                          Hero(
                            tag: lecture.id + lecture.startTime.toString(),
                            child: LectureDetail(
                                icon: Icons.event_outlined,
                                title: 'Date',
                                content:
                                    DateFormat("EEEE, MMMM dd").format(date),
                                iconColor: Colors.pink.shade300),
                          ),
                          Hero(
                            tag: lecture.id +
                                lecture.startTime.toString() +
                                lecture.endTime.toString(),
                            child: LectureDetail(
                                icon: Icons.watch_later_outlined,
                                title: 'Duration',
                                content: lecture.startTime.format(context) +
                                    " - " +
                                    lecture.endTime.format(context),
                                iconColor: Colors.pink.shade300),
                          ),
                        ],
                      ),
                    ),
                    buildLectureType(lecture.type, topPadding: 110),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                'Student List:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final student = Student.list[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Card(
                      shape: CircleBorder(),
                      elevation: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person_outline,
                          color: AppTheme.secondary,
                        ),
                      ),
                    ),
                    title: Text(student.firstName + " " + student.lastName),
                    subtitle: Text("Roll no: " + student.rollNo.toString()),
                    trailing: Text(
                      covertEnumToString(student.year),
                      style: TextStyle(
                          color: AppTheme.accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              );
            }, childCount: Student.list.length),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo_outlined,
          color: AppTheme.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
