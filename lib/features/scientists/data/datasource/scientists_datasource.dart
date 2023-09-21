import 'package:dio/dio.dart';
import 'package:new_project/features/scientists/domain/entity/scientists_model.dart';

class ScientistsDatasource {
  final Dio dio;
  ScientistsDatasource({required this.dio});

  Future<List<ScientistsModel>> getScientists() async {
    try {
      final result = await dio.get("https://crudcrud.com/api/1889ae42c6b04fbf86cc745bcbedc242/users");
      if (result.statusCode != null && (result.statusCode! >= 200 && result.statusCode! < 300)) {
        return (result.data as List).map((e) => ScientistsModel.fromJson(e)).toList();
      } else {
        throw DioException(requestOptions: result.requestOptions);
      }
    } on DioException {
      return [];
    } catch (e) {
      return [];
    }
  }
}
