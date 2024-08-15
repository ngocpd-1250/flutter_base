import 'package:json_annotation/json_annotation.dart';

import 'package:base_flutter/data/model/data_model.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData with DataModel {
  UserData({
    required this.id,
    this.name,
    this.email,
    this.avatar,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @override
  String toString() => 'UserData(id: $id, name: $name, email: $email)';

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
