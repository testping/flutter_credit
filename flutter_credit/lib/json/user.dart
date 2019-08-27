import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  User(this.status,this.message,this.data,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'mobile')
  String mobile;

  @JsonKey(name: 'status')
  int status;

  Data(this.uid,this.token,this.mobile,this.status,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


