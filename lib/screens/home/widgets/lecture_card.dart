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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: lect.id + lect.subject.name,
                    child: LectureDetail(
                        icon: Icons.menu_book_outlined,
                        title: 'Subject',
                        content: lect.subject.name,
                        iconColor: Colors.deepPurple.shade300),
                  ),
                  Hero(
                    tag: lect.id + lect.faculty.name,
                    child: LectureDetail(
                        icon: Icons.person_outline,
                        title: 'Faculty',
                        content: lect.faculty.name,
                        iconColor: Colors.cyan.shade300),
                  ),
                  Hero(
                    tag: lect.id +
                        lect.startTime.toString() +
                        lect.endTime.toString(),
                    child: LectureDetail(
                        icon: Icons.watch_later_outlined,
                        title: 'Duration',
                        content: lect.startTime.format(context) +
                            " - " +
                            lect.endTime.format(context),
                        iconColor: Colors.pink.shade300),
                  ),
                ],
              ),
            ),
            buildLectureType(lect.type),
          ],
        ),
      ),
    );
  }
}

Positioned buildLectureType(LectureType type, {double topPadding}) {
  return Positioned(
    right: 0,
    top: topPadding ?? 15,
    child: Container(
      width: 100,
      height: 30,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        covertEnumToString(type),
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: getbannerColor(type),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
    ),
  );
}

Color getbannerColor(LectureType type) {
  switch (type) {
    case LectureType.Practical:
      return Colors.deepOrange;
    case LectureType.Webinar:
      return AppTheme.accent;
    default:
      return AppTheme.secondary;
  }
}
