import 'package:equatable/equatable.dart';

class ScientistsModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  const ScientistsModel({
    this.id = "",
    this.firstName = "",
    this.lastName = "",
  });

  @override
  List<Object?> get props => [id, firstName, lastName];

  static ScientistsModel fromJson(Map<String, dynamic> json) => ScientistsModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}
