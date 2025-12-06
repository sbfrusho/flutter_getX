import 'package:dio/dio.dart';
import 'package:getx_sm/models/api_root_model.dart';
import 'package:getx_sm/models/character_model.dart';
import 'package:getx_sm/models/planet_model.dart';

class ApiServices {
  final Dio _dio = Dio();

  ApiServices() {
    _dio.options.baseUrl = 'https://swapi.dev/api';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  //Get API Root URLs
  Future<ApiRootModel> getApiRoot() async {
    try {
      final resonse = await _dio.get('/');
      return ApiRootModel.fromJson(resonse.data);
    } catch (e) {
      throw Exception("Failed to load apis: $e");
    }
  }

  //Get character by ID
  Future<CharacterModel> getCharacter(int id) async {
    try {
      final response = await _dio.get('/people/$id/');
      return CharacterModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load: $e');
    }
  }

  //Get planet by id
  Future<PlanetModel> getPlanet(int id) async {
    try {
      final response = await _dio.get('/planets/$id/');
      return PlanetModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load $e');
    }
  }

  //Get Character List(with pagination)
  Future<List<CharacterModel>> getAllCharacters({int page = 1}) async {
    try {
      final response = await _dio.get('/people/', queryParameters: {'page': page});
      final results = response.data['results'] as List;
      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
