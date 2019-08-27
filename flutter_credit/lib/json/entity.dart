import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';


@JsonSerializable()
class Entity extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  String data;

  Entity(this.status,this.message,this.data,);

  factory Entity.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

}


