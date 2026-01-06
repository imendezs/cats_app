import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';
import '../datasources/breed_remote_datasource.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BreedRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Breed>>> getBreeds({int page = 0, int limit = 20}) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No hay conexión a internet'));
    }
    try {
      final breeds = await remoteDataSource.getBreeds(page: page, limit: limit);
      return Right(breeds);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
}
