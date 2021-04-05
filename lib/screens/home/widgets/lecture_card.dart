import 'package:flutter/material.dart';
import 'package:student_attendance/core/app_theme.dart';
import 'package:student_attendance/models/enums.dart';
import 'package:student_attendance/models/lecture.dart';

import 'lecture_detail.dart';

class LectureCard extends StatelessWidget {
  const LectureCard(
    this.lect, {
    Key key,
  }) : super(key: key);

  final Lecture lect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LectureDetail(
                      icon: Icons.menu_book_outlined,
                      title: 'Subject',
                      content: lect.subject.name,
                      iconColor: Colors.deepPurple.shade300),
                  LectureDetail(
                      icon: Icons.person_outline,
                      title: 'Faculty',
                      content: lect.faculty.name,
                      iconColor: Colors.cyan.shade300),
                  LectureDetail(
                      icon: Icons.watch_later_outlined,
                      title: 'Duration',
                      content: lect.startTime.format(context) +
                          " - " +
                          lect.endType.format(context),
                      iconColor: Colors.pink.shade300),
                ],
              ),
            ),
            _buildLectureType()
          ],
        ),
      ),
    );
  }

  Positioned _buildLectureType() {
    return Positioned(
            right: 0,
            top: 15,
            child: Container(
              width: 100,
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                covertEnumToString(lect.type),
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: bannerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          );
  }

  Color get bannerColor {
    switch (lect.type) {
      case LectureType.Practical:
        return Colors.deepOrange;
      case LectureType.Webinar:
        return AppTheme.accent;
      default:
        return AppTheme.secondary;
    }
  }
}