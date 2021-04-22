import 'package:flutter/foundation.dart';

class ApiResponse {
  List<int> presentIds;

  ApiResponse({@required List<dynamic> ids}) {
    presentIds = <int>[];
    for (var id in ids) presentIds.add(int.tryParse(id.toString()));
  }
}
