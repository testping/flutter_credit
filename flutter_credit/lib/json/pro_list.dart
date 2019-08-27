import 'package:json_annotation/json_annotation.dart';

part 'pro_list.g.dart';


@JsonSerializable()
class ProList extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<DataPro> data;

  ProList(this.status,this.message,this.data,);

  factory ProList.fromJson(Map<String, dynamic> srcJson) => _$ProListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProListToJson(this);

}


@JsonSerializable()
class DataPro extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'loaname')
  String loaname;

  @JsonKey(name: 'upload')
  String upload;

  @JsonKey(name: 'amount')
  String amount;

  @JsonKey(name: 'desci')
  String desci;

  @JsonKey(name: 'loanrate')
  String loanrate;

  @JsonKey(name: 'loanlimit')
  String loanlimit;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'sort')
  String sort;

  @JsonKey(name: 'hot')
  String hot;

  DataPro(this.id,this.loaname,this.upload,this.amount,this.desci,this.loanrate,this.loanlimit,this.url,this.sort,this.hot,);

  factory DataPro.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


