import 'package:json_annotation/json_annotation.dart';

part 'agreement.g.dart';


@JsonSerializable()
class Agreement extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<Data> data;

  Agreement(this.status,this.message,this.data,);

  factory Agreement.fromJson(Map<String, dynamic> srcJson) => _$AgreementFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AgreementToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'title')
  String title;

  Data(this.id,this.content,this.title,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


