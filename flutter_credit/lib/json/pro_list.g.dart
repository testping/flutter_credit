// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pro_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProList _$ProListFromJson(Map<String, dynamic> json) {
  return ProList(
    json['status'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : DataPro.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProListToJson(ProList instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataPro _$DataFromJson(Map<String, dynamic> json) {
  return DataPro(
    json['id'] as String,
    json['loaname'] as String,
    json['upload'] as String,
    json['amount'] as String,
    json['desci'] as String,
    json['loanrate'] as String,
    json['loanlimit'] as String,
    json['url'] as String,
    json['sort'] as String,
    json['hot'] as String,
  );
}

Map<String, dynamic> _$DataToJson(DataPro instance) => <String, dynamic>{
      'id': instance.id,
      'loaname': instance.loaname,
      'upload': instance.upload,
      'amount': instance.amount,
      'desci': instance.desci,
      'loanrate': instance.loanrate,
      'loanlimit': instance.loanlimit,
      'url': instance.url,
      'sort': instance.sort,
      'hot': instance.hot,
    };
