import 'package:new_project/core/either.dart';
import 'package:new_project/features/scientists/data/datasource/scientists_datasource.dart';
import 'package:new_project/features/scientists/domain/entity/scientists_model.dart';

class ScientistsRepo {
  final ScientistsDatasource datasource;
  const ScientistsRepo({required this.datasource});
  Future<Either<Exception, List<ScientistsModel>>> getScientists() async {
    try {
      final result = await datasource.getScientists();
      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
    ;
  }
}
