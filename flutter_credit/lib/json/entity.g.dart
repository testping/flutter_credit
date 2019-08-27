// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    json['status'] as int,
    json['message'] as String,
    json['data'] as String,
  );
}

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
