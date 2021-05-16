import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/core/app_theme.dart';
import 'package:student_attendance/core/utils/size_config.dart';
import 'package:student_attendance/models/api_response.dart';
import 'package:student_attendance/models/enums.dart';
import 'package:student_attendance/models/lecture.dart';
import 'package:student_attendance/models/student.dart';
import 'package:student_attendance/screens/home/widgets/lecture_card.dart';
import 'package:student_attendance/screens/home/widgets/lecture_detail.dart';
import 'package:student_attendance/services/api_service.dart';

class LectureDetailsPage extends StatefulWidget {
  final LectureDetailsParams params;
  const LectureDetailsPage(this.params);
  @override
  _LectureDetailsPageState createState() => _LectureDetailsPageState();
}

class _LectureDetailsPageState extends State<LectureDetailsPage> {
  Lecture lecture;
  DateTime date;
  List<File> images = [];
  ApiResponse apiResponse;
  @override
  void initState() {
    super.initState();
    lecture = widget.params.lecture;
    date = widget.params.date;
    apiResponse = ApiResponse(ids: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.white,
            expandedHeight: 300,
            pinned: true,
            iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
            title:
                Text('Lecture Details', style: TextStyle(color: Colors.black)),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).padding.top +
                                  AppBar().preferredSize.height),
                          Hero(
                            tag: lecture.id + lecture.subject.name,
                            child: LectureDetail(
                                icon: Icons.menu_book_outlined,
                                title: 'Subject',
                                content: lecture.subject.name,
                                iconColor: Colors.deepPurple.shade300),
                          ),
                          Hero(
                            tag: lecture.id + lecture.faculty.name,
                            child: LectureDetail(
                                icon: Icons.person_outline,
                                title: 'Faculty',
                                content: lecture.faculty.name,
                                iconColor: Colors.cyan.shade300),
                          ),
                          Hero(
                            tag: lecture.id + lecture.startTime.toString(),
                            child: LectureDetail(
                                icon: Icons.event_outlined,
                                title: 'Date',
                                content:
                                    DateFormat("EEEE, MMMM dd").format(date),
                                iconColor: Colors.pink.shade300),
                          ),
                          Hero(
                            tag: lecture.id +
                                lecture.startTime.toString() +
                                lecture.endTime.toString(),
                            child: LectureDetail(
                                icon: Icons.watch_later_outlined,
                                title: 'Duration',
                                content: lecture.startTime.format(context) +
                                    " - " +
                                    lecture.endTime.format(context),
                                iconColor: Colors.pink.shade300),
                          ),
                        ],
                      ),
                    ),
                    buildLectureType(lecture.type, topPadding: 110),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                'Student List:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          if (apiResponse.presentIds.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  'Tap to Mark/Unmark manually',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final student = Student.list[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Card(
                  elevation: 10,
                  color: apiResponse.presentIds.contains(student.rollNo)
                      ? AppTheme.secondary
                      : null,
                  child: ListTile(
                    onTap: () {
                      if (apiResponse.presentIds.isNotEmpty) {
                        setState(() {
                          apiResponse.presentIds.contains(student.rollNo)
                              ? apiResponse.presentIds.remove(student.rollNo)
                              : apiResponse.presentIds.add(student.rollNo);
                        });
                      }
                    },
                    leading: Card(
                      shape: CircleBorder(),
                      elevation: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          apiResponse.presentIds.contains(student.rollNo)
                              ? Icons.check
                              : Icons.person_outline,
                          color: apiResponse.presentIds.contains(student.rollNo)
                              ? AppTheme.accent
                              : AppTheme.secondary,
                        ),
                      ),
                    ),
                    title: Text(student.firstName + " " + student.lastName),
                    subtitle: Text("Roll no: " + student.rollNo.toString()),
                    trailing: Text(
                      covertEnumToString(student.year),
                      style: TextStyle(
                          color: AppTheme.accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              );
            }, childCount: Student.list.length),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          if (images.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  'Images:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      color: AppTheme.primary,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.file(
                          images[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () => setState(
                          () => images.remove(images[index]),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.redAccent,
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              );
            }, childCount: images.length),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_a_photo_outlined,
            color: AppTheme.white,
          ),
          onPressed: clickImage),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: AppTheme.primary,
        height: images.isNotEmpty ? getScreenHeight(context) * 0.1 : 0,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: RaisedButton(
                  color: AppTheme.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => WillPopScope(
                        onWillPop: () => Future.value(false),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                    apiResponse = await uploadImageToServer(images, context);
                    setState(() => Navigator.of(context).pop());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      apiResponse.presentIds.isNotEmpty
                          ? 'Upload Again'
                          : 'Upload Images',
                      style: TextStyle(color: AppTheme.white),
                    ),
                  )),
            ),
            if (apiResponse.presentIds.isNotEmpty) SizedBox(width: 10),
            if (apiResponse.presentIds.isNotEmpty)
              Expanded(
                child: RaisedButton(
                    color: AppTheme.accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Done',
                        style: TextStyle(color: AppTheme.white),
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }

  void clickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final image = File(pickedFile.path);
      setState(() => images.add(image));
    }
  }
}
