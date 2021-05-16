import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:student_attendance/models/api_response.dart';

Future<ApiResponse> uploadImageToServer(
    List<File> imageFiles, BuildContext context) async {
  try {
    print("attempting to connect to server……");
    var uri = Uri.parse('http://21974d7bb1a3.ngrok.io/');
    var request = new http.MultipartRequest('POST', uri);
    print('connection established.');
    imageFiles.forEach((image) async {
      var stream = new http.ByteStream(image.openRead());
      var length = await image.length();
      print(length);
      print(image.path);
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    });
    var response = await request.send();
    print(response.statusCode);
    http.StreamedResponse streamedResponse = response;
    final String responseIds = await streamedResponse.stream.bytesToString();
    Map<String, dynamic> data = json.decode(responseIds);
    Fluttertoast.showToast(msg: 'Succes');
    return ApiResponse(ids: data['present_ids']);
  } catch (e) {
    print('Exception Occurred: $e');
    Fluttertoast.showToast(msg: 'Exception Occurred: $e');
    return ApiResponse(ids: []);
  }
}
