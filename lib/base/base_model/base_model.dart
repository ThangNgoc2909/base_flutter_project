import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  anyMap: true,
  explicitToJson: true,
)
class BaseListData<T> {
  BaseListData({this.data, this.status});

  factory BaseListData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseListDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseListDataToJson(this, toJsonT);

  @JsonKey(name: 'data')
  List<T>? data;
  @JsonKey(name: 'code')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable(
  genericArgumentFactories: true,
  anyMap: true,
  explicitToJson: true,
)
class BasePagingListData<T> {
  BasePagingListData({this.data, this.status});

  factory BasePagingListData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BasePagingListDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BasePagingListDataToJson(this, toJsonT);

  @JsonKey(name: 'data')
  PagingData<T>? data;
  @JsonKey(name: 'code')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable(
  genericArgumentFactories: true,
  anyMap: true,
  explicitToJson: true,
)
class BaseData<T> {
  BaseData({this.data, this.status});

  factory BaseData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseDataToJson(this, toJsonT);

  @JsonKey(name: 'data')
  T? data;
  @JsonKey(name: 'code')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable(
  genericArgumentFactories: true,
  anyMap: true,
  explicitToJson: true,
)
class PagingData<T> {
  PagingData({this.results, this.total});

  @JsonKey(name: 'results')
  List<T>? results;
  @JsonKey(name: 'total')
  int? total;

  factory PagingData.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PagingDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PagingDataToJson(this, toJsonT);
}
