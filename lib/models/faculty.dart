import 'package:flutter/cupertino.dart';
import 'package:student_attendance/models/enums.dart';

import 'subject.dart';

@immutable
class Faculty {
  final String firstName, lastName, id;
  final List<Subject> subjects;
  final Department dept;

  Faculty({
    @required this.firstName,
    @required this.lastName,
    @required this.id,
    @required this.subjects,
    @required this.dept,
  });

  String get name =>
      "Prof. " +
      this.firstName.substring(0, 1).toUpperCase() +
      this.firstName.substring(1).toLowerCase() +
      " " +
      this.lastName.substring(0, 1).toUpperCase() +
      this.lastName.substring(1).toLowerCase();

  static Faculty profSarita = Faculty(
    firstName: 'Sarita',
    lastName: 'Ambadekar',
    id: 'F1',
    subjects: <Subject>[
      Subjects.dbms,
      Subjects.os,
    ],
    dept: Department.Computer,
  );

  static Faculty profAarti = Faculty(
    firstName: 'Aarti',
    lastName: 'Sathiya',
    id: 'F2',
    subjects: <Subject>[
      Subjects.cPlusPlus,
      Subjects.ddl,
    ],
    dept: Department.Computer,
  );

  static Faculty profChitra = Faculty(
    firstName: 'Chitra',
    lastName: 'Bhole',
    id: 'F3',
    subjects: <Subject>[
      Subjects.se,
    ],
    dept: Department.Computer,
  );

  static Faculty profKavita = Faculty(
    firstName: 'Kavita',
    lastName: 'Bhate',
    id: 'F4',
    subjects: <Subject>[
      Subjects.wdl,
    ],
    dept: Department.Computer,
  );

  static Faculty profJignasha = Faculty(
    firstName: 'Jignasha',
    lastName: 'Dalal',
    id: 'F5',
    subjects: <Subject>[
      Subjects.ds,
      Subjects.microProcessor,
    ],
    dept: Department.Computer,
  );

  static Faculty profMedha = Faculty(
    firstName: 'Medha',
    lastName: 'Ambadekar',
    id: 'F6',
    subjects: <Subject>[
      Subjects.ddl,
      Subjects.microProcessor,
    ],
    dept: Department.Electrical,
  );

  static List<Faculty> get list => <Faculty>[
        profSarita,
        profAarti,
        profChitra,
        profKavita,
        profJignasha,
        profMedha,
      ];
}
