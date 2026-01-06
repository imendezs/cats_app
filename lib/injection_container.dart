import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/breeds/data/datasources/breed_remote_datasource.dart';
import 'features/breeds/data/repositories/breed_repository_impl.dart';
import 'features/breeds/domain/repositories/breed_repository.dart';
import 'features/breeds/domain/usecases/get_breeds.dart';
import 'features/breeds/presentation/bloc/breeds_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => BreedsBloc(getBreeds: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetBreeds(sl()));

  // Repository
  sl.registerLazySingleton<BreedRepository>(
    () => BreedRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<BreedRemoteDataSource>(
    () => BreedRemoteDataSourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
