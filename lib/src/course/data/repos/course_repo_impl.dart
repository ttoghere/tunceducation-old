import 'package:dartz/dartz.dart';
import 'package:tunceducation/core/errors/errors.dart';
import 'package:tunceducation/core/utils/utils.dart';
import 'package:tunceducation/src/course/data/datasources/course_remote_data_src.dart';
import 'package:tunceducation/src/course/domain/entities/course.dart';
import 'package:tunceducation/src/course/domain/repos/course_repo.dart';

class CourseRepoImpl implements CourseRepo {
  const CourseRepoImpl(this._remoteDataSrc);

  final CourseRemoteDataSrc _remoteDataSrc;

  @override
  ResultFuture<void> addCourse(Course course) async {
    try {
      await _remoteDataSrc.addCourse(course);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Course>> getCourses() async {
    try {
      final courses = await _remoteDataSrc.getCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
