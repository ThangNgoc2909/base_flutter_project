// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListData<T> _$BaseListDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListData<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      status: json['code'] as int?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$BaseListDataToJson<T>(
  BaseListData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonT).toList(),
      'code': instance.status,
      'message': instance.message,
    };

BasePagingListData<T> _$BasePagingListDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    BasePagingListData<T>(
      data: json['data'] == null
          ? null
          : PagingData<T>.fromJson(
              Map<String, dynamic>.from(json['data'] as Map),
              (value) => fromJsonT(value)),
      status: json['code'] as int?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$BasePagingListDataToJson<T>(
  BasePagingListData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.toJson(
        (value) => toJsonT(value),
      ),
      'code': instance.status,
      'message': instance.message,
    };

BaseData<T> _$BaseDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    BaseData<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      status: json['code'] as int?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$BaseDataToJson<T>(
  BaseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'code': instance.status,
      'message': instance.message,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

PagingData<T> _$PagingDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    PagingData<T>(
      results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PagingDataToJson<T>(
  PagingData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results?.map(toJsonT).toList(),
      'total': instance.total,
    };
