enum Year { FE, SE, TE, BE }
enum Department { Computer, IT, Mechanical, Electrical, ETRX }
enum Screens { Home, Settings, Account }
enum LectureType { Practical, Theory, Webinar, Break }

String covertEnumToString(enumVal) => enumVal.toString().split('.').last;
