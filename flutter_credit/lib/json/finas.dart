import 'package:json_annotation/json_annotation.dart';

part 'finas.g.dart';


@JsonSerializable()
class Finas extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  Finas(this.status,this.message,this.data,);

  factory Finas.fromJson(Map<String, dynamic> srcJson) => _$FinasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FinasToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'evilLevel')
  int evilLevel;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'mobile')
  String mobile;

  Data(this.evilLevel,this.tag,this.uid,this.mobile,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


