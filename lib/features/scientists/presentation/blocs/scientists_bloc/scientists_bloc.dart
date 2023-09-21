import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:new_project/features/scientists/data/datasource/scientists_datasource.dart';
import 'package:new_project/features/scientists/data/repository/scientists_repo.dart';
import 'package:new_project/features/scientists/domain/entity/scientists_model.dart';

part 'scientists_event.dart';
part 'scientists_state.dart';

class ScientistsBloc extends Bloc<ScientistsEvent, ScientistsState> {
  final ScientistsRepo repository = ScientistsRepo(datasource: ScientistsDatasource(dio: Dio()));
  ScientistsBloc() : super(const ScientistsState()) {
    on<GetScientistEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await repository.getScientists();
      if (response.isRight) {
        print("response => ${response.right}");

        emit(
          state.copyWith(scientists: response.right, status: FormzSubmissionStatus.success),
        );
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
