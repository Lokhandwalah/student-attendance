import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/models/faculty.dart';
import 'package:student_attendance/models/lecture.dart';
import 'package:student_attendance/models/subject.dart';

abstract class Database {
  Future getLectures({@required int weekDay});
}

class DBService extends Database {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final CollectionReference _studentCollection =
      _db.collection('students');
  static final CollectionReference _teacherCollection =
      _db.collection('teachers');
  static final CollectionReference _subjectCollection =
      _db.collection('subjects');
  static final CollectionReference _scheduledLecturesCollection =
      _db.collection('scheduled_lectures');
  static final CollectionReference _attendanceCollection =
      _db.collection('attendance');
  static final CollectionReference _studentAttendanceCollection =
      _db.collection('attended_lectures');

  @override
  Future<List<Lecture>> getLectures(
      {String day, int weekDay, bool refresh = false}) async {
    List<Lecture> lectures = Lecture.getLectures(weekDay) ?? [];
    try {
      if (lectures.isNotEmpty && !refresh) return lectures;
      final dayDoc = await _scheduledLecturesCollection.doc(day).get();
      final lectureDocs = (await dayDoc.reference
              .collection('lectures')
              .orderBy('start_time')
              .get())
          .docs;
      for (DocumentSnapshot doc in lectureDocs)
        lectures.add(await getLecturefromDoc(doc));
      Lecture.setLectures(weekDay, lectures);
      return lectures;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<DocumentSnapshot> getSubject(String subjectId) async {
    final doc = await _subjectCollection.doc(subjectId).get();
    return doc;
  }

  Future<DocumentSnapshot> getTeacher(String teacherId) async {
    final doc = await _teacherCollection.doc(teacherId).get();
    return doc;
  }

  Future<Lecture> getLecturefromDoc(lectDoc) async {
    final data = lectDoc.data();
    final teacherDoc = await getTeacher(data['teacher_id']);
    final Faculty faculty =
        await Faculty.fromJson(teacherDoc.data(), teacherDoc.id);
    final subjectDoc = await getSubject(data['subject_id']);
    final Subject subject = Subject.fromJson(subjectDoc.data(), subjectDoc.id);
    final lecture = Lecture.fromJson(
        data: data, lectId: lectDoc.id, subject: subject, faculty: faculty);
    return lecture;
  }
}
