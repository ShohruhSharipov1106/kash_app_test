part of 'scientists_bloc.dart';

abstract class ScientistsEvent extends Equatable {
  const ScientistsEvent();
}

class GetScientistEvent extends ScientistsEvent {
  const GetScientistEvent();
  @override
  List<Object?> get props => [];
}
