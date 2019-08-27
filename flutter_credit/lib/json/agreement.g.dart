// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agreement _$AgreementFromJson(Map<String, dynamic> json) {
  return Agreement(
    json['status'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AgreementToJson(Agreement instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as String,
    json['content'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'title': instance.title,
    };
