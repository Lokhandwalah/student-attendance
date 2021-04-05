import 'package:flutter/material.dart';
import 'package:student_attendance/models/lecture.dart';

class LectureDetails extends StatefulWidget {
  @override
  _LectureDetailsState createState() => _LectureDetailsState();
}

class _LectureDetailsState extends State<LectureDetails> {
  Lecture lecture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lecture = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(lecture.subject.name),
      ),
    );
  }
}
