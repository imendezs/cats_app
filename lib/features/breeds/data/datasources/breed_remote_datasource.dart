import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/breed_model.dart';

abstract class BreedRemoteDataSource {
  Future<List<BreedModel>> getBreeds({int page = 0, int limit = 20});
}

class BreedRemoteDataSourceImpl implements BreedRemoteDataSource {
  final http.Client client;

  BreedRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BreedModel>> getBreeds({int page = 0, int limit = 20}) async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.breedsEndpoint}')
          .replace(queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      });
      
      final response = await client.get(
        uri,
        headers: {
          ApiConstants.apiKeyHeader: ApiConstants.apiKey,
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: ApiConstants.connectionTimeout),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => BreedModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          'Failed to load breeds. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw NetworkException('Network error: ${e.toString()}');
    }
  }
}
