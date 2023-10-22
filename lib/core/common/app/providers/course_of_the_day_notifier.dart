import 'package:flutter/foundation.dart';
import 'package:tunceducation/core/common/features/course/domain/entities/course.dart';

class CourseOfTheDayNotifier extends ChangeNotifier {
  Course? _courseOfTheDay;

  Course? get courseOfTheDay => _courseOfTheDay;

  void setCourseOfTheDay(Course course) {
    _courseOfTheDay ??= course;
    notifyListeners();
  }
}