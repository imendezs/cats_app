import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/breed.dart';
import '../repositories/breed_repository.dart';

class GetBreeds implements UseCase<List<Breed>, GetBreedsParams> {
  final BreedRepository repository;

  GetBreeds(this.repository);

  @override
  Future<Either<Failure, List<Breed>>> call(GetBreedsParams params) async {
    return await repository.getBreeds(page: params.page, limit: params.limit);
  }
}
