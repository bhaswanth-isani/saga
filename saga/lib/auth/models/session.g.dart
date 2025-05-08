// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  token: json['token'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  ipAddress: json['ipAddress'] as String?,
  deviceName: json['deviceName'] as String,
  deviceType: $enumDecode(_$DeviceTypeEnumMap, json['deviceType']),
  userId: json['userId'] as String,
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'token': instance.token,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'ipAddress': instance.ipAddress,
  'deviceName': instance.deviceName,
  'deviceType': _$DeviceTypeEnumMap[instance.deviceType]!,
  'userId': instance.userId,
};

const _$DeviceTypeEnumMap = {
  DeviceType.android: 'android',
  DeviceType.ios: 'ios',
  DeviceType.web: 'web',
  DeviceType.macos: 'macos',
  DeviceType.windows: 'windows',
  DeviceType.linux: 'linux',
};
