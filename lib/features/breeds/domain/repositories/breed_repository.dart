import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/breed.dart';

abstract class BreedRepository {
  Future<Either<Failure, List<Breed>>> getBreeds({int page = 0, int limit = 20});
}
