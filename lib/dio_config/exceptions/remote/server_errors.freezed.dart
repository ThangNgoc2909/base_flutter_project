// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServerError {
  /// server-defined status code
  int? get statusCode => throw _privateConstructorUsedError;

  /// server-defined error id
  int? get errorId => throw _privateConstructorUsedError;

  /// server-defined message
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerErrorCopyWith<ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res, ServerError>;
  @useResult
  $Res call({int? statusCode, int? errorId, String? message});
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res, $Val extends ServerError>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? errorId = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorId: freezed == errorId
          ? _value.errorId
          : errorId // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerErrorCopyWith<$Res>
    implements $ServerErrorCopyWith<$Res> {
  factory _$$_ServerErrorCopyWith(
          _$_ServerError value, $Res Function(_$_ServerError) then) =
      __$$_ServerErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? statusCode, int? errorId, String? message});
}

/// @nodoc
class __$$_ServerErrorCopyWithImpl<$Res>
    extends _$ServerErrorCopyWithImpl<$Res, _$_ServerError>
    implements _$$_ServerErrorCopyWith<$Res> {
  __$$_ServerErrorCopyWithImpl(
      _$_ServerError _value, $Res Function(_$_ServerError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? errorId = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ServerError(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorId: freezed == errorId
          ? _value.errorId
          : errorId // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError({this.statusCode, this.errorId, this.message});

  /// server-defined status code
  @override
  final int? statusCode;

  /// server-defined error id
  @override
  final int? errorId;

  /// server-defined message
  @override
  final String? message;

  @override
  String toString() {
    return 'ServerError(statusCode: $statusCode, errorId: $errorId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerError &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorId, errorId) || other.errorId == errorId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, errorId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerErrorCopyWith<_$_ServerError> get copyWith =>
      __$$_ServerErrorCopyWithImpl<_$_ServerError>(this, _$identity);
}

abstract class _ServerError implements ServerError {
  const factory _ServerError(
      {final int? statusCode,
      final int? errorId,
      final String? message}) = _$_ServerError;

  @override

  /// server-defined status code
  int? get statusCode;
  @override

  /// server-defined error id
  int? get errorId;
  @override

  /// server-defined message
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ServerErrorCopyWith<_$_ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}
