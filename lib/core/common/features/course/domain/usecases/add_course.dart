import 'package:tunceducation/core/common/features/course/domain/entities/course.dart';
import 'package:tunceducation/core/common/features/course/domain/repos/course_repo.dart';
import 'package:tunceducation/core/usecases/usecases.dart';
import 'package:tunceducation/core/utils/utils.dart';

class AddCourse extends FutureUsecaseWithParams<void, Course> {
  const AddCourse(this._repo);

  final CourseRepo _repo;

  @override
  ResultFuture<void> call(Course params) async => _repo.addCourse(params);
}
