import 'package:dartz/dartz.dart';
import 'package:tunceducation/core/errors/exceptions.dart';
import 'package:tunceducation/core/errors/failures.dart';
import 'package:tunceducation/core/utils/typedefs.dart';
import 'package:tunceducation/src/course/features/materials/data/datasources/material_remote_data_src.dart';
import 'package:tunceducation/src/course/features/materials/domain/entities/resource.dart';
import 'package:tunceducation/src/course/features/materials/domain/repos/material_repo.dart';

class MaterialRepoImpl implements MaterialRepo {
  const MaterialRepoImpl(this._remoteDataSource);

  final MaterialRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<List<Resource>> getMaterials(String courseId) async {
    try {
      final result = await _remoteDataSource.getMaterials(courseId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> addMaterial(Resource material) async {
    try {
      await _remoteDataSource.addMaterial(material);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
