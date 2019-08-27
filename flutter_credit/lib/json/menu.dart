import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';


@JsonSerializable()
class Menu extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<Data> data;

  Menu(this.status,this.message,this.data,);

  factory Menu.fromJson(Map<String, dynamic> srcJson) => _$MenuFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenuToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'tip')
  String tip;

  Data(this.id,this.title,this.tip,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


