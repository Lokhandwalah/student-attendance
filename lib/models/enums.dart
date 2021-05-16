enum Year { FE, SE, TE, BE }
enum Department { Computer, IT, Mechanical, Electrical, ETRX }
enum Screens { Home, Settings, Account }
enum LectureType { Practical, Theory, Webinar, Break }

LectureType getLectureType(String type) {
  switch (type) {
    case 'THEORY':
      return LectureType.Theory;
    case 'PRACTICAL':
      return LectureType.Practical;
    case 'WEBINAR':
      return LectureType.Webinar;
    default:
      return LectureType.Theory;
  }
}

Year getYear(String year) {
  switch (year) {
    case 'SE':
      return Year.SE;
    case 'TE':
      return Year.TE;
    case 'BE':
      return Year.BE;
    default:
      return Year.FE;
  }
}
Department getDepartment(String dept) {
  switch (dept) {
    case 'COMPUTER':
      return Department.Computer;
    case 'IT':
      return Department.IT;
    case 'ELECTRICAL':
      return Department.Electrical;
    case 'ETRX':
      return Department.ETRX;
    default:
      return Department.Mechanical;
  }
}

String covertEnumToString(enumVal) => enumVal.toString().split('.').last;
