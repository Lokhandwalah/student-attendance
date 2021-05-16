import 'package:flutter/cupertino.dart';

import 'enums.dart';

@immutable
class Subject {
  final String id, name, shortName;
  final Year year;
  final Department dept;

  Subject({
    @required this.name,
    @required this.shortName,
    @required this.id,
    @required this.year,
    @required this.dept,
  });

  static Subject fromJson(Map<String, dynamic> data, String subjectId) {
    return Subject(
      id: subjectId,
      name: data['name'],
      shortName: data['name_short'],
      year: getYear(data['year']),
      dept: getDepartment(data['dept']),
    );
  }
}

class Subjects {
  static Subject dbms = Subject(
    name: 'Database Management System',
    shortName: 'DBMS',
    id: 'C1',
    year: Year.TE,
    dept: Department.Computer,
  );

  static Subject microProcessor = Subject(
    name: 'Micro Processor',
    shortName: 'Micro',
    id: 'C2',
    year: Year.TE,
    dept: Department.Electrical,
  );

  static Subject os = Subject(
    name: 'Operating System',
    shortName: 'OS',
    id: 'C3',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject cPlusPlus = Subject(
    name: 'C++',
    shortName: 'C++',
    id: 'C4',
    year: Year.FE,
    dept: Department.Computer,
  );

  static Subject ds = Subject(
    name: 'Data structures',
    shortName: 'DS',
    id: 'C5',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject se = Subject(
    name: 'Software Engineering',
    shortName: 'SE',
    id: 'C6',
    year: Year.BE,
    dept: Department.Computer,
  );

  static Subject ddl = Subject(
    name: 'Digital design & Logic',
    shortName: 'DDL',
    id: 'C7',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject wdl = Subject(
    name: 'Web Develpoment',
    shortName: 'WD',
    id: 'C8',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject ml = Subject(
    name: 'Machine Learning',
    shortName: 'ML',
    id: 'C9',
    year: Year.TE,
    dept: Department.Computer,
  );
}
