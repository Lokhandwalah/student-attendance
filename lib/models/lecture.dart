import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_attendance/models/enums.dart';
import 'package:student_attendance/models/faculty.dart';

import 'subject.dart';

@immutable
class Lecture {
  final String id;
  final Subject subject;
  final Faculty faculty;
  final TimeOfDay startTime, endType;
  final LectureType type;

  Lecture({
    @required this.id,
    @required this.subject,
    @required this.faculty,
    @required this.startTime,
    @required this.endType,
    @required this.type,
  });

  static List<Lecture> todayLectures = [];

  static void init(int weekDay) => todayLectures = getLectures(weekDay);

  static void addLect(Lecture lect) => todayLectures.add(lect);
  
  static void removeLec(Lecture lect) => todayLectures.remove(lect);

  static List<Lecture> getLectures(int weekDay) {
    switch (weekDay) {
      case 1:
        return monday;
      case 2:
        return tuesday;
      case 3:
        return wednesday;
      case 4:
        return thursday;
      case 5:
        return friday;
      case 6:
        return saturday;
      default:
        return <Lecture>[];
    }
  }

  static List<Lecture> monday = <Lecture>[
    Lecture(
      id: 'L1',
      subject: Subjects.dbms,
      faculty: Faculty.profSarita,
      startTime: TimeOfDay(hour: 9, minute: 0),
      endType: TimeOfDay(hour: 9, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L2',
      subject: Subjects.cPlusPlus,
      faculty: Faculty.profAarti,
      startTime: TimeOfDay(hour: 10, minute: 0),
      endType: TimeOfDay(hour: 10, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L3',
      subject: Subjects.ds,
      faculty: Faculty.profJignasha,
      startTime: TimeOfDay(hour: 11, minute: 0),
      endType: TimeOfDay(hour: 11, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L4',
      subject: Subjects.microProcessor,
      faculty: Faculty.profMedha,
      startTime: TimeOfDay(hour: 12, minute: 0),
      endType: TimeOfDay(hour: 12, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L5',
      subject: Subjects.ds,
      faculty: Faculty.profJignasha,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endType: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.Practical,
    ),
  ];

  static List<Lecture> tuesday = <Lecture>[
    Lecture(
      id: 'L6',
      subject: Subjects.microProcessor,
      faculty: Faculty.profMedha,
      startTime: TimeOfDay(hour: 9, minute: 0),
      endType: TimeOfDay(hour: 9, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L7',
      subject: Subjects.cPlusPlus,
      faculty: Faculty.profAarti,
      startTime: TimeOfDay(hour: 10, minute: 0),
      endType: TimeOfDay(hour: 10, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L8',
      subject: Subjects.os,
      faculty: Faculty.profSarita,
      startTime: TimeOfDay(hour: 11, minute: 0),
      endType: TimeOfDay(hour: 11, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L9',
      subject: Subjects.wdl,
      faculty: Faculty.profKavita,
      startTime: TimeOfDay(hour: 12, minute: 0),
      endType: TimeOfDay(hour: 12, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L10',
      subject: Subjects.wdl,
      faculty: Faculty.profKavita,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endType: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.Practical,
    ),
  ];

  static List<Lecture> wednesday = <Lecture>[
    Lecture(
      id: 'L11',
      subject: Subjects.se,
      faculty: Faculty.profChitra,
      startTime: TimeOfDay(hour: 9, minute: 0),
      endType: TimeOfDay(hour: 9, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L12',
      subject: Subjects.ds,
      faculty: Faculty.profJignasha,
      startTime: TimeOfDay(hour: 10, minute: 0),
      endType: TimeOfDay(hour: 10, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L13',
      subject: Subjects.cPlusPlus,
      faculty: Faculty.profAarti,
      startTime: TimeOfDay(hour: 11, minute: 0),
      endType: TimeOfDay(hour: 11, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L14',
      subject: Subjects.wdl,
      faculty: Faculty.profKavita,
      startTime: TimeOfDay(hour: 12, minute: 0),
      endType: TimeOfDay(hour: 12, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L15',
      subject: Subjects.os,
      faculty: Faculty.profAarti,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endType: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.Practical,
    ),
  ];

  static List<Lecture> thursday = <Lecture>[
    Lecture(
      id: 'L16',
      subject: Subjects.microProcessor,
      faculty: Faculty.profMedha,
      startTime: TimeOfDay(hour: 9, minute: 0),
      endType: TimeOfDay(hour: 9, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L17',
      subject: Subjects.cPlusPlus,
      faculty: Faculty.profAarti,
      startTime: TimeOfDay(hour: 10, minute: 0),
      endType: TimeOfDay(hour: 10, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L18',
      subject: Subjects.os,
      faculty: Faculty.profSarita,
      startTime: TimeOfDay(hour: 11, minute: 0),
      endType: TimeOfDay(hour: 11, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L19',
      subject: Subjects.wdl,
      faculty: Faculty.profKavita,
      startTime: TimeOfDay(hour: 12, minute: 0),
      endType: TimeOfDay(hour: 12, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L20',
      subject: Subjects.wdl,
      faculty: Faculty.profKavita,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endType: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.Practical,
    ),
  ];

  static List<Lecture> friday = <Lecture>[
    Lecture(
      id: 'L21',
      subject: Subjects.dbms,
      faculty: Faculty.profSarita,
      startTime: TimeOfDay(hour: 9, minute: 0),
      endType: TimeOfDay(hour: 9, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L22',
      subject: Subjects.cPlusPlus,
      faculty: Faculty.profAarti,
      startTime: TimeOfDay(hour: 10, minute: 0),
      endType: TimeOfDay(hour: 10, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L23',
      subject: Subjects.ds,
      faculty: Faculty.profJignasha,
      startTime: TimeOfDay(hour: 11, minute: 0),
      endType: TimeOfDay(hour: 11, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L24',
      subject: Subjects.microProcessor,
      faculty: Faculty.profMedha,
      startTime: TimeOfDay(hour: 12, minute: 0),
      endType: TimeOfDay(hour: 12, minute: 45),
      type: LectureType.Theory,
    ),
    Lecture(
      id: 'L25',
      subject: Subjects.ds,
      faculty: Faculty.profJignasha,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endType: TimeOfDay(hour: 14, minute: 0),
      type: LectureType.Practical,
    ),
  ];

  static List<Lecture> saturday = <Lecture>[
    Lecture(
      id: 'W1',
      subject: Subjects.ml,
      faculty: Faculty.profKavita,
      startTime: TimeOfDay(hour: 11, minute: 0),
      endType: TimeOfDay(hour: 13, minute: 0),
      type: LectureType.Webinar,
    ),
  ];
}
