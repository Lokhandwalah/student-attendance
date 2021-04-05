import 'package:flutter/cupertino.dart';

import 'enums.dart';

@immutable
class Subject {
  final String name, id;
  final Year year;
  final Department dept;

  Subject({
    @required this.name,
    @required this.id,
    @required this.year,
    @required this.dept,
  });
}

class Subjects {
  static Subject dbms = Subject(
    name: 'Database Management System',
    id: 'C1',
    year: Year.TE,
    dept: Department.Computer,
  );

  static Subject microProcessor = Subject(
    name: 'Micro Processor',
    id: 'C2',
    year: Year.TE,
    dept: Department.Electrical,
  );

  static Subject os = Subject(
    name: 'Operating System',
    id: 'C3',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject cPlusPlus = Subject(
    name: 'C++',
    id: 'C4',
    year: Year.FE,
    dept: Department.Computer,
  );

  static Subject ds = Subject(
    name: 'Data structures',
    id: 'C5',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject se = Subject(
    name: 'Software Engineering',
    id: 'C6',
    year: Year.BE,
    dept: Department.Computer,
  );

  static Subject ddl = Subject(
    name: 'Digital design & Logic',
    id: 'C7',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject wdl = Subject(
    name: 'Web Develpoment',
    id: 'C8',
    year: Year.SE,
    dept: Department.Computer,
  );

  static Subject ml = Subject(
    name: 'Machine Learning',
    id: 'C9',
    year: Year.TE,
    dept: Department.Computer,
  );
}
