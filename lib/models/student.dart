import 'package:flutter/foundation.dart';

import 'enums.dart';

class Student {
  final String id, firstName, middleName, lastName;
  final int rollNo;
  final Year year;

  Student({
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
    @required this.id,
    @required this.rollNo,
    @required this.year,
  });

  factory Student.fromJson(Map<String, dynamic> data) {
    return Student(
        id: data['std_id'].toString(),
        rollNo: int.tryParse(data['roll_no'].toString()),
        firstName: data['f_name'] as String,
        middleName: data['m_name'] as String,
        lastName: data['l_name'] as String,
        year: getYear(data['year'].toString()));
  }

  static Year getYear(String yr) {
    Year year;
    switch (yr) {
      case 'FE':
        year = Year.FE;
        break;
      case 'SE':
        year = Year.SE;
        break;
      case 'TE':
        year = Year.TE;
        break;
      case 'BE':
        year = Year.BE;
        break;
    }
    return year;
  }

  static List<Student> get list => <Student>[
        Student(
          firstName: 'Husain',
          middleName: 'Yusuf',
          lastName: 'Lokhandwala',
          id: 'S1',
          rollNo: 27,
          year: Year.TE,
        ),
        Student(
          firstName: 'Samyukta',
          middleName: 'M',
          lastName: 'Nair',
          id: 'S2',
          rollNo: 33,
          year: Year.TE,
        ),
        Student(
          firstName: 'Mokshash',
          middleName: 'Y',
          lastName: 'Ostwal',
          id: 'S3',
          rollNo: 35,
          year: Year.TE,
        ),
        Student(
          firstName: 'Wahab',
          middleName: 'M',
          lastName: 'Shaikh',
          id: 'S4',
          rollNo: 54,
          year: Year.TE,
        ),
        Student(
          firstName: 'Mitanshu',
          middleName: 'K',
          lastName: 'Reshamwala',
          id: 'S5',
          rollNo: 47,
          year: Year.TE,
        ),
        Student(
          firstName: 'Pooja',
          middleName: 'K',
          lastName: 'Raval',
          id: 'S6',
          rollNo: 48,
          year: Year.TE,
        ),
        Student(
          firstName: 'Ashu',
          middleName: 'C',
          lastName: 'Singh',
          id: 'S7',
          rollNo: 68,
          year: Year.TE,
        ),
        Student(
          firstName: 'Romit',
          middleName: 'K',
          lastName: 'Singh',
          id: 'S8',
          rollNo: 4,
          year: Year.TE,
        ),
        Student(
          firstName: 'Kapil',
          middleName: 'K',
          lastName: 'Hingu',
          id: 'S9',
          rollNo: 40,
          year: Year.TE,
        ),
        Student(
          firstName: 'Isha',
          middleName: 'C',
          lastName: 'Naik',
          id: 'S10',
          rollNo: 1,
          year: Year.TE,
        ),
        Student(
          firstName: 'Burhan',
          middleName: 'K',
          lastName: 'Udaipurwala',
          id: 'S11',
          rollNo: 20,
          year: Year.TE,
        ),
        Student(
          firstName: 'Asra',
          middleName: 'C',
          lastName: 'Shaikh',
          id: 'S12',
          rollNo: 60,
          year: Year.TE,
        )
      ];
}
