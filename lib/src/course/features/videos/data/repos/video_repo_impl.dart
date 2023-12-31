import 'package:dartz/dartz.dart';
import 'package:tunceducation/core/errors/exceptions.dart';
import 'package:tunceducation/core/errors/failures.dart';
import 'package:tunceducation/core/utils/typedefs.dart';
import 'package:tunceducation/src/course/features/videos/data/datasources/video_remote_data_src.dart';
import 'package:tunceducation/src/course/features/videos/domain/entities/video.dart';
import 'package:tunceducation/src/course/features/videos/domain/repos/video_repo.dart';

class VideoRepoImpl implements VideoRepo {
  const VideoRepoImpl(this._remoteDataSrc);

  final VideoRemoteDataSrc _remoteDataSrc;

  @override
  ResultFuture<void> addVideo(Video video) async {
    try {
      await _remoteDataSrc.addVideo(video);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Video>> getVideos(String courseId) async {
    try {
      final result = await _remoteDataSrc.getVideos(courseId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
