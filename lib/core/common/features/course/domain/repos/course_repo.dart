import 'package:tunceducation/core/common/features/course/domain/entities/course.dart';
import 'package:tunceducation/core/utils/utils.dart';

abstract class CourseRepo {
  const CourseRepo();

  ResultFuture<List<Course>> getCourses();

  ResultFuture<void> addCourse(Course course);
}
