part of 'scientists_bloc.dart';

class ScientistsState extends Equatable {
  final List<ScientistsModel> scientists;
  final FormzSubmissionStatus status;

  const ScientistsState({
    this.status = FormzSubmissionStatus.initial,
    this.scientists = const [],
  });

  ScientistsState copyWith({List<ScientistsModel>? scientists, FormzSubmissionStatus? status}) => ScientistsState(
        status: status ?? this.status,
        scientists: scientists ?? this.scientists,
      );

  @override
  List<Object?> get props => [scientists, status];
}
