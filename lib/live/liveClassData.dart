import 'package:flutter/material.dart';

class CreateLiveClassData extends ChangeNotifier {
  String subject = '';
  String teacherName = '';

  void updateSubject(String newSubject) {
    subject = newSubject;
    notifyListeners();
  }

  void updateTeacherName(String newTeacherName) {
    teacherName = newTeacherName;
    notifyListeners();
  }
}
