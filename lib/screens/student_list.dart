import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/sql_service.dart';

class DataTableDemo extends StatefulWidget {
  //
  DataTableDemo() : super();

  final String title = 'Flutter Data Table';

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<Student> _students;
  GlobalKey<ScaffoldState> _scaffoldKey;
  // Student _selectedStudent;
  // bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    super.initState();
    _students = [];
    // _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _getStudents();
  }

  // Method to update title in the AppBar Title
  _showProgress(String message) => setState(() => _titleProgress = message);

  _showSnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // _createTable() {
  //   _showProgress('Creating Table...');
  //   SQLService.createTable().then((result) {
  //     if ('success' == result) {
  //       // Table is created successfully.
  //       _showSnackBar(context, result);
  //       _showProgress(widget.title);
  //     }
  //   });
  // }

  // Now lets add an Student
  // _addStudent() {
  //   if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
  //     print('Empty Fields');
  //     return;
  //   }
  //   _showProgress('Adding Student...');
  //   Services.addStudent(_firstNameController.text, _lastNameController.text)
  //       .then((result) {
  //     if ('success' == result) {
  //       _getStudents(); // Refresh the List after adding each Student...
  //       _clearValues();
  //     }
  //   });
  // }

  _getStudents() {
    _showProgress('Loading Students...');
    SQLService.getStudents().then((studentList) {
      setState(() => _students = studentList);
      _showSnackBar(context, 'Fetched Students Records');
      _showProgress(widget.title); // Reset the title...
      print("Length ${studentList.length}");
    });
  }

  // _updateStudent(Student Student) {
  //   setState(() {
  //     _isUpdating = true;
  //   });
  //   _showProgress('Updating Student...');
  //   Services.updateStudent(
  //           Student.id, _firstNameController.text, _lastNameController.text)
  //       .then((result) {
  //     if ('success' == result) {
  //       _getStudents(); // Refresh the list after update
  //       setState(() {
  //         _isUpdating = false;
  //       });
  //       _clearValues();
  //     }
  //   });
  // }

  // _deleteStudent(Student Student) {
  //   _showProgress('Deleting Student...');
  //   Services.deleteStudent(Student.id).then((result) {
  //     if ('success' == result) {
  //       _getStudents(); // Refresh after delete...
  //     }
  //   });
  // }

  // Method to clear TextField values
  // _clearValues() {
  //   _firstNameController.text = '';
  //   _lastNameController.text = '';
  // }

  // _showValues(Student Student) {
  //   _firstNameController.text = Student.firstName;
  //   _lastNameController.text = Student.lastName;
  // }

  // Let's create a DataTable and show the Student list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('ROll NO'),
            ),
            DataColumn(
              label: Text('FIRST NAME'),
            ),
            DataColumn(
              label: Text('LAST NAME'),
            ),
            DataColumn(
              label: Text('YEAR'),
            ),
          ],
          rows: _students
              .map(
                (student) => DataRow(cells: [
                  DataCell(
                    Text(
                      student.id.toString(),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.rollNo.toString(),
                    ),
                  ),
                  DataCell(Text(
                    student.firstName.toUpperCase(),
                  )),
                  DataCell(
                    Text(
                      student.lastName.toUpperCase(),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.year.toString().split('.').last,
                    ),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress), // we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              print("fetching students");
              _getStudents();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _dataBody(),
            ),
          ],
        ),
      ),
    );
  }
}
