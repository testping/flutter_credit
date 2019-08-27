// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Finas _$FinasFromJson(Map<String, dynamic> json) {
  return Finas(
    json['status'] as int,
    json['message'] as String,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FinasToJson(Finas instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['evilLevel'] as int,
    json['tag'] as String,
    json['uid'] as String,
    json['mobile'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'evilLevel': instance.evilLevel,
      'tag': instance.tag,
      'uid': instance.uid,
      'mobile': instance.mobile,
    };
