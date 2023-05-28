import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  DataResponse({
    @JsonKey(name: 'data') this.data,
  });

  // ignore: avoid-dynamic
  factory DataResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$DataResponseFromJson(json, fromJsonT);

  final T? data;
}

@JsonSerializable(genericArgumentFactories: true)
class DataListResponse<T> {
  DataListResponse({
    @JsonKey(name: 'data') this.data,
  });

  // ignore: avoid-dynamic
  factory DataListResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$DataListResponseFromJson(json, fromJsonT);

  final List<T>? data;
}
